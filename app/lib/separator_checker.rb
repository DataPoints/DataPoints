# Name of Author: Peter Uherek
# Created at: 18.04.2015
#
# Description: Rozoznanie spearatora v csv subore
require 'logger'

class SeparatorChecker
  def find_separator(path)
    @logger = Logger.new(STDOUT)
    @logger.level = Logger::DEBUG

    file = File.open(path, 'r')
    line = file.readline().force_encoding('windows-1250')

    begin
      occurrance = find_number_of_occurence(line)
    rescue Exception => e
      @logger.warn 'Change encoding from windows-1250 to UTF-8.'
      line = file.readline().force_encoding('UTF-8')
      occurrance = find_number_of_occurence(line)
    end

    maximum = occurrance.max
    index = occurrance.index(maximum)
    case index
      when 0
        return ','
      when 1
        return ';'
    end
  end

  private
  def find_number_of_occurence(line)
    occurrance = Array.new()
    occurrance << line.count(',')
    occurrance << line.count(';')
  end

end
