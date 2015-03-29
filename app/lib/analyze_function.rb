# Name of Author: Peter Uherek
# Created at: 30.11. 2014
#
# Description: Vytvorenie a naplnenie generickej tabulky na zaklade csv suboru.
require 'cmd_interface'

class AnalyzeFunction

def r_clean_dataset(dataset)
    path = dataset.storage
    cmd = "Rscript app/lib/r/cleanData.R #{path}"
    puts cmd
    CMDInterface.new.Exec_command(cmd)
end

def r_analyze_dataset(dataset)
    dataset_id = dataset.id
    header_id = dataset.headers.first.id

    config   = Rails.configuration.database_configuration
    dbName = config[Rails.env]["database"]
    dbUsername = config[Rails.env]["username"]
    dbPassword = config[Rails.env]["password"]

    cmd = "Rscript app/lib/r/analyze.R #{dbName} #{dbUsername} #{dbPassword} #{dataset_id} #{header_id} "
    puts cmd
    CMDInterface.new.Exec_command(cmd)
end

def r_analyze_dataset_user(dataset,column)
  dataset_id = dataset.id
  column_id = column.id
  column_name = column.label


  config   = Rails.configuration.database_configuration
  dbName = config[Rails.env]["database"]
  dbUsername = config[Rails.env]["username"]
  dbPassword = config[Rails.env]["password"]

  cmd = "Rscript app/lib/r/analyze.R  #{dbName} #{dbUsername} #{dbPassword} #{dataset_id} #{column_id} #{column_name}"
  puts cmd
  CMDInterface.new.Exec_command(cmd)
end

 def analyze_dataset
 	@new_class, @column_names = loading_table("1:1")
 	number_of_unique_values_in_da_columnes(@new_class,@column_names)
 	#number_of_unique(@new_class,@column_names)
 end

 private
 def number_of_unique(new_class,column_names)
 	column_names.each do |column_name|
		puts column_name
		result = new_class.find(
		:all,
		:select => 'count(*) count, #{column_name}',
		:group => '#{column_name}',
		:order => 'count DESC',
		:linit => 1)

		#puts result
		puts "Hallo"
	end
 end


 private
 def number_of_unique_values_in_da_columnes(new_class,column_names)
 	column_names.each do |column_name|
		result = new_class.select(column_name).distinct.count()
		puts result
	end
 end

 private
 def loading_table(name_of_dataset)
    begin
	new_class = Class.new(ActiveRecord::Base) { self.table_name = name_of_dataset }
	column_names = new_class.columns.map(&:name)
	rescue
		puts "Error #{$!}"
	end
	return new_class,column_names
 end
end