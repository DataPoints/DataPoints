require 'net/http'
require 'digest/md5'
require 'table_factory.rb'
require 'analyze_function.rb'
require 'check_semicolon'
require 'sample_analyzer'
require 'logger'
require 'io/console'


class FileTypeError < Exception
end

class FileSizeExceedsQuota < Exception
end

class CannotAccessToUrl < Exception
end


class WorkFlow

  def start(dataset, send_mail)
    @logger = Logger.new(STDOUT)
    @logger.level = Logger::DEBUG
    @logger.debug "dataset being downloaded"
    @dataset = dataset
    begin
      download
      remove_semicolon
      r_cleanData
      add_semicolon
      pred_processing
      find_type
      r_analyze
      @dataset.status = 'P'
      @dataset.save
      if send_mail == 'true'
        @dataset.user.send_success_email(@dataset)
      end
    rescue Exception => e
      @dataset.status = 'E'
      puts e.to_s
      @dataset.save
      # @dataset.user.send_error_email(e.to_s)
    end
  end

  def download
    #Select dataset from database by origin_uri
    #dataset_already_exists = Dataset.where(originuri: @dataset.link).length > 0

    #Prepare enviroment variables
    origin_uri = URI(@dataset.link)
    target_file = (0...50).map { ('a'..'z').to_a[rand(26)] }.join
    target_extension = File.extname(origin_uri.path)
    target_uri = Settings.dataset_target_path + target_file + target_extension

    currentDownloadAttempt = 1
    numberOfDownloadAttemptsBeforeFailure = Settings.numberOfDownloadAttemptsBeforeFailure
    delayBetweenAnotherDownloadAttempt = Settings.delayBetweenAnotherDownloadAttempt
    @fileMaxSizeInBytes = Settings.fileMaxSizeInBytes
    @fileToBeWrittenInto = nil

    #if !dataset_already_exists
    #Dataset does not already exists

    begin

      if (origin_uri == nil)
        puts origin_uri.host + " " + @dataset.link
        raise CannotAccessToUrl, "Provided url is not Url"
      end

      @totalSize = 0
      @counter = 0

      #Download dataset from given url
      Net::HTTP.start(origin_uri.host, origin_uri.port) do |http|
        request = Net::HTTP::Get.new origin_uri

        response = http.request_head(origin_uri)
        @totalSize = response['content-length'].to_i

        if(! response.kind_of? Net::HTTPSuccess)
          raise CannotAccessToUrl, response.code
        end
        if(@totalSize > @fileMaxSizeInBytes)
          @logger.warn "File size: #@totalSize exceeds allowed quota #@fileMaxSizeInBytes"
          raise FileSizeExceedsQuota, "File size: #@totalSize exceeds allowed quota #@fileMaxSizeInBytes"
        end
        if (!(response['content-type'].include? "text/csv") && !(response['content-type'].include? "text/plain"))
          @logger.warn "File has wrong content type: " + response['content-type']
          raise FileTypeError, response['content-type']
        end

        lastWrittenPercentualProgress = 0;
        http.request request do |response|
          #We need to open file for binary write
          File.open(target_uri, "wb+") do |f|
            response.read_body do |chunk|
              f.write(chunk)
              @counter += chunk.length
              currentProgress = (@counter.to_f/@totalSize*100).round
              @logger.debug "chunk: #@counter  / of total: #@totalSize in percent:"  + currentProgress.to_s
              if(currentProgress / 10 > lastWrittenPercentualProgress / 10)
                lastWrittenPercentualProgress = currentProgress
                @dataset.downloadProgress = currentProgress;
                @dataset.save
                @logger.debug "Download progress has been written to db: " + @dataset.downloadProgress.to_s + " %"
              end
            end
          end
        end
      end

      #Create datasets hash
      dataset_hash = Digest::MD5.hexdigest(File.read(target_uri))

      @dataset.filehash = dataset_hash
      @dataset.storage = target_uri
      @dataset.downloadstatus = 1
      @dataset.originuri = @dataset.link
      @dataset.save

        # rescue TypeError => e
        #   raise 'URL: "' + @dataset.link + '" you provided seems to be invalid :( ' + e.message
    rescue FileSizeExceedsQuota => q
      @logger.warn q.message
      raise FileSizeExceedsQuota, q.message
    rescue FileTypeError => p
      @logger.warn 'Downloaded file is not csv file type: ' + p.message
      raise 'Downloaded file is not csv file type: ' + p.message
    rescue CannotAccessToUrl => k
      @logger.warn 'Cannot access to provided url: ' + @dataset.link + ' ; reason: ' + k.message
      raise 'Cannot access to provided url: ' + @dataset.link + ' ; reason: ' + k.message
    rescue SocketError => r
      @logger.warn 'Cannot connect to server: ' + @dataset.link
      if currentDownloadAttempt < numberOfDownloadAttemptsBeforeFailure
        currentDownloadAttempt+=1
        @logger.debug "Going to sleep before another download attempt"
        sleep delayBetweenAnotherDownloadAttempt * currentDownloadAttempt
        @logger.debug "Woken up from sleep before another download attempt"
        retry
      end
      raise 'Cannot connect to server: ' + @dataset.link
      ensure
        # Always will be executed
    end
  end

  def pred_processing
    TableFactory.new.builder(@dataset)
  end

  def find_type
    NamedEntity.new.def_types(@dataset.id)
  end

  def r_cleanData
    AnalyzeFunction.new.r_clean_dataset(@dataset)
  end

  def r_analyze
    AnalyzeFunction.new.r_analyze_dataset(@dataset)
  end

  def remove_semicolon
    CheckSemicolon.new.remove_semicolon(@dataset.storage)
  end

  def add_semicolon
    CheckSemicolon.new.add_semicolon(@dataset.storage)
  end
end