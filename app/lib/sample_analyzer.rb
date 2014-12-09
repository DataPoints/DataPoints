class SampleAnalyzer

  def analyze(dataset)

    dataset.status = "A"
    dataset.save

    # puts "Going to sleep for 35 seconds"
    # sleep 35
    # puts "Woke up from sleep"

    analysisResult = AnalysisResult.create(
        result: {
            median_stlpca: "2,14",
            pocet_poloziek: 10024
        }
    )
    analysisResult.dataset = dataset;


    analysisResult.analysisProgress = 10;
    if(analysisResult.save)
      puts "saved1"
    else
      puts "not saved1"
    end
    puts "Going to sleep for 15 seconds"
    sleep 15
    puts "Woke up from sleep"

    analysisResult.analysisProgress = 30;
    if(analysisResult.save)
      puts "saved 3"
    else
      puts "not saved 3"
    end
    puts "Going to sleep for 15 seconds"
    sleep 15
    puts "Woke up from sleep"

    analysisResult.analysisProgress = 60;
    if(analysisResult.save)
      puts "saved 60"
    else
      puts "not saved"
    end
    puts "Going to sleep for 15 seconds"
    sleep 15
    puts "Woke up from sleep"

    analysisResult.analysisProgress = 80;
    if(analysisResult.save)
      puts "saved 80"
    else
      puts "not saved 80"
    end
    puts "Going to sleep for 15 seconds"
    sleep 15
    puts "Woke up from sleep"

    analysisResult.analysisProgress = 100;
    if(analysisResult.save)
      puts "saved 100"
    else
      puts "not saved 100"
    end
    puts "Going to sleep for 15 seconds"
    sleep 15
    puts "Woke up from sleep"

    if(analysisResult.save)
      # dataset.status = "EA"
      dataset.save
    else
      puts "dataset neulozeny"
    end

  end

end