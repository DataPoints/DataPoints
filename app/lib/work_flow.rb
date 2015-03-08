class WorkFlow
  def start(dataset)
    @dataset = dataset
    begin
      download
      pred_processing
      find_type
      return true
    rescue Exception => e
      @dataset.status = e.to_s
      @dataset.save
      return e
      # @dataset.user.send_error_email(e.to_s)
    end
  end

  def download
#Select dataset from database by origin_uri
    dataset_already_exists = Dataset.where(originuri: @dataset.link).length > 0


    #if !dataset_already_exists
    #Dataset does not already exists

    begin
      #Prepare enviroment variables
      origin_uri = URI(@dataset.link)
      target_file = (0...50).map { ('a'..'z').to_a[rand(26)] }.join
      target_extension = File.extname(origin_uri.path)
      target_uri = Settings.dataset_target_path + target_file + target_extension

      if (!origin_uri.host)
        raise TypeError, "Wrong URL"
      end

      #Download dataset from given url
      Net::HTTP.start(origin_uri.host, origin_uri.port) do |http|
        request = Net::HTTP::Get.new origin_uri

        http.request request do |response|
          #We need to open file for binary write
          File.open(target_uri, "wb+") do |f|
            response.read_body do |chunk|
              f.write(chunk)
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

      if @dataset.save

        # TableFactory.new.builder(@dataset)

        # flash[:success] = 'Dataset successfully downloaded :) ' + @dataset.link + " " + dataset_already_exists.to_s
        # return 'Dataset successfully downloaded :) ' + @dataset.link + " " + dataset_already_exists.to_s
        # redirect_to root_path
        #   return
      else
        raise 'Dataset download failed :( ' + @dataset.link
        #   # render 'new'
      end

    rescue TypeError => e
      logger.warn 'URL seems to be invalid : ' + @dataset.link
      raise 'URL: "' + @dataset.link + '" you provided seems to be invalid :( '
    rescue SocketError => r
      logger.warn 'Cannot connect to server: ' + @dataset.link
      raise 'Cannot connect to server: ' + @dataset.link
    end
# else
#   #Dataset already exists
#   existing_dataset = Dataset.where(originuri: @dataset.link)[0]
#   # TODO We need to create new mapping table dataset:user
#
#   flash[:success] = 'Dataset has not been downloaded, already exists :) '
#   redirect_to root_path
# end
  end

  def pred_processing
    if TableFactory.new.builder(@dataset) != 0
      raise 'Nastala chyba pri predprocesingu...'
    end
  end

  def find_type
    NamedEntity.new.def_types(@dataset.id)
  end
end