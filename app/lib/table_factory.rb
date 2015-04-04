# Name of Author: Peter Uherek, Martin Losak
# Created at: 17.11. 2014
# Updated at: 9.3. 2015
#
# Description: Vytvorenie a naplnenie generickej tabulky na zaklade csv suboru.

require 'csv'
require 'named_entity'
require 'cmd_interface'


class TableFactory
 def builder(dataset)
      #Vytvorenie mena noveho datasetu
      name_of_data_table = "#{dataset.user_id}:#{dataset.id}"
      #Nahratie dat z datasetu
      path = dataset.storage
      puts "storage is here: " + dataset.storage
      #Kontrola ci je subor csv
      control_file_format(path)
      #Nahratie a parsovanie datasetu
      data = parsing_csv(path)

      #Genericke vytvorenie tabuliek
      create_table(name_of_data_table,data[0])
      #Ulozenie mena datasetu do tabulky datasets
      upload_dataset_table("data_table_name",name_of_data_table,dataset)
      #Vytvorenie noveho zaznamu v tabulke headers
      header_id = fill_header(dataset.id)
      #Vytvorenie noveho zaznamu v tabulke columns
      fill_column(header_id,data[0])
      #Naplnenie vyplnenej tabulky
      fill_storage(name_of_data_table,data)
      #Zisti typy columnov
      # NamedEntity.new.def_types(dataset.id)
  end

 private
 def control_file_format(path)
   number_of_last_occurence_dots=path.rindex('.')
   format = path[number_of_last_occurence_dots,path.length]
   puts format
   if format !='.csv'
      cmd = "rm #{path}"
      CMDInterface.new.Exec_command(cmd)
      raise "Dataset is not .csv file"
   end
 end

  private
  def upload_dataset_table(name,stor,dataset)
    begin
     dataset.update(:"#{name}" => stor)                 
    rescue Exception => e
      raise "Update crashed. Error #{$!}"
    end
  end

  private
  def parsing_csv(path)
    begin
      puts path
      file = File.read(path)
      puts file
      csv = CSV.parse(file, :col_sep => ';')
      header = csv[0]
      puts header
    rescue
        raise "Path to the dataset is wrong. Error: #{$!}"
    end
    return csv
  end

  private
  def fill_storage(name_of_dataset,data)
    begin
    new_class = Class.new(ActiveRecord::Base) { self.table_name = name_of_dataset } 
    # 'o' is now a wrapper for the row of some_table where 'id = 1'
    cols = new_class.columns.map(&:name)
    data.shift
    
    data.each do |row|
      new_record = new_class.new()
      for i in 1..cols.count()-1
        new_record[cols[i]] = row[i-1]
      end
      new_record.save! 
    end
    rescue
      raise "Process crashed during insert new records into #{name_of_dataset}. Error #{$!}"
    end
  end

  private
  def fill_header(id)
    new_header = Header.new
    new_header.origin = true
    @dataset = Dataset.find(id) 
    new_header.dataset_id = @dataset.id
    new_header.save!
    return new_header.id
  end

  private
  def fill_column(id,header)
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
  def create_table(name_of_data_table,header)
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
      t.string :"#{header[i]}"
    end 
  end
end