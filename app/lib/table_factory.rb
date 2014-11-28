# Name of Author: Peter Uherek, Martin Losak
# Created at: 17.11. 2014
#
# Description: Vytvorenie a naplnenie generickej tabulky na zaklade csv suboru.

require 'csv'
require 'stanford-core-nlp'
require 'date'

class TableFactory
 def builder(dataset)
    Thread.new do
      #Vytvorenie mena noveho datasetu
      num1 = dataset.user_id
      num2 = dataset.id
      name_of_data_table = "#{num1}:#{num2}"
      #Nahratie dat z datasetu
      path = dataset.storage
      puts path
      data = parsing_csv(path)
      if data == 1
        return 1
      end

      flag = 0
      #Generice vytvorenie tabuliek
      if create_table(name_of_data_table,data[0]) == 0
        #Ulozenie mena datasetu do tabulky datasets
        flag += upload_dataset_table("data_table_name",name_of_data_table,dataset)
        #Vytvorenie noveho zaznamu v tabulke headers 
        header_id = fill_header(dataset.id)
        #Vytvorenie noveho zaznamu v tabulke columns
        flag += fill_column(header_id,data[0])
        #Naplnenie vyplnenej tabulky
        flag += fill_storage(name_of_data_table,data)
        return flag
      else
        return 1
      end

    end
  end

  private
  def upload_dataset_table(name,stor,dataset)
    begin
     dataset.update(:"#{name}" => stor)                 
    rescue Exception => e
        puts "Update chrashed. Error #{$!}"
       return 1               
    end
    return 0                
  end

  private
  def parsing_csv(path)
    begin
    file = File.read(path).force_encoding('Windows-1250').encode('UTF-8')
    csv = CSV.parse(file, :col_sep => ';')
    header = csv[0]
    puts header
    rescue
      puts "Path to the dataset is wrong. Error: #{$!}"
      return 1
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
      puts "Process crashed during insert new records into #{name_of_dataset}. Error #{$!}"
      return 1
    end
      return 0
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
      new_column.datatyp = "string";
      new_column.type_id = 1;
      new_column.save!
    end
    rescue
      puts "Process chrashed during insert new records into Columns table.Error #{$!}"
      return 1
    end
    return 0
  end

 private
  def create_table(name_of_data_table,header)
    flag1 = table_creator(name_of_data_table,method(:column_factory),header)
    return flag1
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
      puts "Table wasn`t created. Error #{$!}"
      return 1
    end
    return 0
  end

  private
  def column_factory(t,header)
    puts "Number of columns #{header.count()-1}"
    for i in 0..header.count()-2
      puts "#{i}:#{header[i]}"
      t.string :"#{header[i]}"
    end 
  end

  private
  def def_type(data)
    data.shift

    #skontrolovat prve tri riadky pola prostrednictvom NER

    #ak NER nevrati pri urcitom indexe name entity, skontrolovat prostrednictvom REGEX

    #ak REGEX nevrati pri urcitom indexe name entity, skontrolovat cez vstavane funkcie z ruby

    #ak nevrati RUBYCHECK pri urcitom indexe name entity, skontrolovat HEADERS
  end

 private
 def def_type_by_NER(value)
  begin
    value = "j.kmetko@gmail.com";
    pipeline =  StanfordCoreNLP.load(:tokenize, :ssplit, :pos, :lemma, :parse, :ner, :dcoref)
    text = StanfordCoreNLP::Annotation.new(value)
    pipeline.annotate(text)

    text.get(:sentences).each do |sentence|
      sentence.get(:tokens).each do |token|
        # Named entity tag
        namedentity = token.get(:named_entity_tag).to_s
      end
    end

    #mapovanie vystupov :named_entity_tag na nase ekvivalenty

    return namedentity
  end
 end

  private
  def def_type_by_REGEX(values)
    begin
      values.each do |value|

        #regex for email - upraveny standard z RFC 5322
        if (value =~ /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/)
          return "Email"
        elsif value =~ /(?=\b[a-zA-Z ]*?[aeiouAEIOU][a-zA-Z ]*\b)\b[a-zA-Z ]*\b/
            return "Meno"
        elsif value =~ /^[a-zA-Z\u0080-\u024F\s\/\-\)\(\`\.\"\']+$/
            return "Mesto"
        else
          return false
        end
        
      end
    end
 end

  private
  def def_type_by_RUBYCHECK(values)
    begin

    end
  end

  private
  def def_type_by_LABEL
    begin
      header = data[0]

      header.each do |value|
        if (value == "Email" || value == "E-mail" || value == "email" || value = "e-mail")
          return "Email"
        elsif (value == "Mesto" || value == "mesto")
          return "Mesto"
        elsif (value == "Meno" || value == "meno")
          return "Meno"
        end
      end

    end
  end
end