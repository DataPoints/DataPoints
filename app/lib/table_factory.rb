# Name of Author: Peter Uherek, Martin Losak
# Created at: 17.11. 2014
# Updated at: 18.4. 2015
#
# Description: Vytvorenie a naplnenie generickej tabulky na zaklade csv suboru.

require 'csv'
require 'named_entity'
require 'cmd_interface'
require 'logger'
require 'separator_checker'


class TableFactory
 def builder(dataset)

    @logger = Logger.new(STDOUT)
    @logger.level = Logger::DEBUG

    # Prepare environment
    tableName = create_name_of_dataset(dataset)
    check_format_file(dataset.storage)
    rawData = parsing_csv(dataset.storage)
    @logger.debug "Environment in Table Factory was successfully created"
    @logger.debug "Table name is "+tableName

    # Process of creating new table and other dependencies
    create_new_table(tableName,rawData[0])
    @logger.debug "Create new table completed"

    insert_table_name_to_datasets_table("data_table_name",tableName,dataset)
    @logger.debug "Insert data into datasets table completed"

    headerID = insert_data_into_header_table(dataset.id)
    @logger.debug "Insert data into header table completed"

    insert_data_into_columns_table(headerID,rawData[0])
    @logger.debug "Insert data into columns table completed"

    insert_data_into_new_created_table(tableName,rawData)
    @logger.debug "Insert data into new created table completed"

    # Recongize type of columns
    # NamedEntity.new.def_types(dataset.id)
  end

 private
 def check_format_file(path)
   number_of_last_occurence_dots=path.rindex('.')
   format = path[number_of_last_occurence_dots,path.length]
   if format !='.csv'
      cmd = "rm #{path}"
      CMDInterface.new.Exec_command(cmd)
      raise "Dataset is not .csv file"
   end
 end

  private
  def insert_table_name_to_datasets_table(name,table_name,dataset)
    begin
     dataset.update(:"#{name}" => table_name)
    rescue Exception => e
      raise "Update crashed. Error #{$!}"
    end
  end

  private
  def parsing_csv(path)
    begin
      puts path
      file = File.read(path)
      character = SeparatorChecker.new.find_separator(path)
      csv = CSV.parse(file, :col_sep => character)
    rescue Errno::ENOENT
        raise "Path to the dataset is wrong. Error: #{$!}"
    rescue CSV::MalformedCSVError
        raise "Somtehing is wrong with dataset. Error: #{$!}"
    end
    return csv
  end

  private
  def insert_data_into_new_created_table(name_of_dataset,data)
    begin
    new_class = Class.new(ActiveRecord::Base) { self.table_name = name_of_dataset } 
    # 'o' is now a wrapper for the row of some_table where 'id = 1'
    cols = new_class.columns.map(&:name)
    data.shift

    check_number =(data.count*10)/100
    ten_percent = (data.count*10)/100
    counter = 0

    data.each do |row|
      new_record = new_class.new()
      for i in 1..cols.count()-1
        new_record[cols[i]] = row[i-1]
      end
      new_record.save!
      counter += 1

      if(check_number==counter)
        @logger.debug "Inserted rows #{counter}/#{data.count} in percent #{check_number}%"
        check_number += ten_percent
      end
    end
    @logger.debug "Inserted rows #{counter}/#{data.count} in percent #{check_number}%"
    rescue
      raise "Process crashed during insert new records into #{name_of_dataset}. Error #{$!}"
    end
  end

  private
  def insert_data_into_header_table(id)
    begin
    new_header = Header.new
    new_header.origin = true
    @dataset = Dataset.find(id) 
    new_header.dataset_id = @dataset.id
    new_header.save!
    rescue
      raise "Process chrashed during insert new records into Header table.Error #{$!}"
    end
    return new_header.id
  end

  private
  def insert_data_into_columns_table(id,header)
    begin
    for i in 0..header.count()-2
      new_column = Column.new
      new_column.label = header[i]
      new_column.header_id = id
      new_column.datatyp = "string"
      new_column.save!
    end
    rescue
      raise "Process chrashed during insert new records into Columns table.Error #{$!}"
    end
  end

 private
  def create_new_table(name_of_data_table,header)
    table_creator(name_of_data_table,method(:column_factory),header)
  end

  def table_creator(name,function,header)
    begin
      ActiveRecord::Schema.define do
        create_table :"#{name}" do |t|
            #(define your columns just as you would in a migration file)
          function.call(t,header)
        end
      end
    rescue
      raise "Table wasn`t created. Error #{$!}"
    end
  end

  private
  def column_factory(t,header)
    puts "Number of columns #{header.count()-1}"
    for i in 0..header.count()-2
      puts "#{i}:#{header[i]}"
      if header[i]=='id'
        header[i]='origin_id'
        @logger.warn 'Dataset has id column. Origin id column had to be rewritten'
        puts "#{i}:#{header[i]}"
      end
      t.string :"#{header[i]}"
    end 
  end


  private
  def create_name_of_dataset(dataset)
    return "#{dataset.user_id}:#{dataset.id}"
  end
end