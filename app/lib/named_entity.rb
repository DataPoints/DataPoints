# Name of Author: Jakub Kmetko
# Created at: 01.12. 2014
#
# Description: Zistenie typu (named entity) dat z Columns na zaklade REGEX

#require 'stanford-core-nlp'

class NamedEntity

  public
  def def_types(dataset_id)
    @dataset                    = Dataset.find(dataset_id)
    @headers                    = Header.find_by(dataset_id: @dataset.id)
    name_of_dataset_data_table  = @dataset.data_table_name
    @data                       = Class.new(ActiveRecord::Base) { self.table_name = name_of_dataset_data_table }
    column                      = Class.new(ActiveRecord::Base) { self.table_name = "columns" }

    @values = @data.content_columns();
    cols = @values.map(&:name)

    @types_hash = { }
    for i in 0..cols.count-1
      @types_hash[cols[i]]= get_type(@data.find(1)[cols[i]])
    end

    @types_hash.each do |key, type|
      col = column.find_by(header_id: @headers.id, label: key)
      col.update(type_id: type)
    end

    return @types_hash
  end

  private
  def get_type(value)
    begin
      emailREGEX = /b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/;
      osobaREGEX = /(?=\b[a-zA-Z ]*?[aeiouAEIOU][a-zA-Z ]*\b)\b[a-zA-Z ]*\b/

      #regex for email - upraveny standard z RFC 5322
      if value =~ emailREGEX
        type = "Email"
      elsif value.valid_date?
        type = "Dátum"
      elsif value.valid_integer? || value.valid_float?
        type = "Číslo"
      elsif !Geocoder.coordinates(value).nil?
        type = "Miesto"
      elsif value =~ osobaREGEX
        type = "Osoba"
      else
        type = "N/A"
      end

      type_id = map_type(type)

      return type_id
    end
  end

  private
  def map_type(type_name)
    @type = Type.find_by(name: type_name)
    return @type.id
  end

  public
  def def_entity_by_NER(value)
    begin

      StanfordCoreNLP.use :english
      StanfordCoreNLP.model_files = {}
      StanfordCoreNLP.default_jars = [ 'joda-time.jar', 'xom.jar', 'stanford-corenlp-3.3.1.jar', 'stanford-corenlp-3.3.1-models.jar', 'jollyday.jar', 'bridge.jar' ]

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

end

class String
  def valid_integer?
    [
        /^[-+]?[1-9]([0-9]*)?$/, # decimal
        /^0[0-7]+$/,             # octal
        /^0x[0-9A-Fa-f]+$/,      # hexadecimal
        /^0b[01]+$/              # binary
    ].each do |match_pattern|
      return true if self =~ match_pattern
    end
    return false
  end

  def valid_float?
    !!Float(self) rescue false
  end

  def valid_date?
    temp = self.gsub(/[-.\/]/, '')
    ['%m%d%Y','%m%d%y','%M%D%Y','%M%D%y'].each do |f|
      begin
        return true if Date.strptime(temp, f)
      rescue
        #do nothing
      end
    end

    return false
  end
end