class SampleAnalyzer

  def analyze(dataset)

    dataset.status = "A"
    dataset.save

    table_name = dataset.data_table_name
    @data = Class.new(ActiveRecord::Base) {
      self.table_name = table_name
    }

    output = {}

    dataset_columns    = dataset.headers.all.first.columns.all
    dataset_columns.each_with_index do |column, index|
      if (column.type_id == 4)
        puts "#{index} . #{column.label} je cislo"
        columnValues = @data.pluck(column.label)

        max = 0;
        min = 999999;
        maxValueLabel = "max#{index}"
        minValueLabel = "min#{index}"

        columnValues.each do |number|
          number2 = number
          number2 = number2.gsub! ',', '.'
          number2 = number2.gsub! ' ', ''

          begin
            if (number2.to_f > max)
              max = number2.to_f
            end

            if (min > number2.to_f)
              min = number2.to_f
            end
          rescue Exception => e
            puts "#{number} is invalid"
          end
        end

        output[maxValueLabel] = max
        output[minValueLabel] = min

      else
        puts "#{index} . #{column.label} nie je cislo"
      end

    end


    analysisResult = AnalysisResult.create(
        result: output
    )
    analysisResult.dataset = dataset;


    analysisResult.analysisProgress = 10;
    if(analysisResult.save)
      puts "saved1"
    else
      puts "not saved1"
    end
    puts "Going to sleep for 15 seconds"
    # sleep 15
    puts "Woke up from sleep"

    analysisResult.analysisProgress = 30;
    if(analysisResult.save)
      puts "saved 3"
    else
      puts "not saved 3"
    end
    puts "Going to sleep for 15 seconds"
    # sleep 15
    puts "Woke up from sleep"

    analysisResult.analysisProgress = 60;
    if(analysisResult.save)
      puts "saved 60"
    else
      puts "not saved"
    end
    puts "Going to sleep for 15 seconds"
    # sleep 15
    puts "Woke up from sleep"

    analysisResult.analysisProgress = 80;
    if(analysisResult.save)
      puts "saved 80"
    else
      puts "not saved 80"
    end
    puts "Going to sleep for 15 seconds"
    # sleep 15
    puts "Woke up from sleep"

    analysisResult.analysisProgress = 100;
    if(analysisResult.save)
      puts "saved 100"
    else
      puts "not saved 100"
    end
    puts "Going to sleep for 15 seconds"
    # sleep 15
    puts "Woke up from sleep"

    if(analysisResult.save)
      # dataset.status = "EA"
      dataset.save
    else
      puts "dataset neulozeny"
    end

  end

end