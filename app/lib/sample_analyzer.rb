class SampleAnalyzer

  def analyze(dataset)

    puts "Going to sleep for 15 seconds"
    sleep 15
    puts "Woke up from sleep"

    analysisResult = AnalysisResult.create(
        result: {
            median_stlpca: "2,14",
            pocet_poloziek: 10024
        }
    )
    analysisResult.dataset = dataset;

    if(analysisResult.save)
      dataset.status = "EA"
      dataset.save
    end
  end

end