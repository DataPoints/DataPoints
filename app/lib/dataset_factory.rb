class DatasetFactory

  def firstDataset(id)

    puts id.to_s
    dataset = Dataset.new
    dataset.name = "Demo dataset"
    dataset.description = "This is your first dataset. It enables you to try out the functionality of our app."
    dataset.link = "http://demo.sk"
    dataset.storage = "app/lib/FirstDataset/FirstDataset.csv"
    dataset.user_id = id
    dataset.downloadProgress=100
    dataset.downloadstatus='1'
    dataset.status = 'P'
    dataset.data_table_name = "first_datasets"
    dataset.save(validate: false)
    puts "Dataset sa ulozil"

    new_header = Header.new
    new_header.dataset_id = dataset.id
    new_header.origin = true
    new_header.save

    Column.create(header_id: "#{new_header.id}", label: 'Obchodne_meno', type_id: '8', datatyp: 'string')
    Column.create(header_id: "#{new_header.id}", label: 'PSC', type_id: '1', datatyp: 'string')
    Column.create(header_id: "#{new_header.id}", label: 'Ulica', type_id: '5', datatyp: 'string')
    Column.create(header_id: "#{new_header.id}", label: 'Mesto_Obec', type_id: '5', datatyp: 'string')
    Column.create(header_id: "#{new_header.id}", label: 'ICO', type_id: '7', datatyp: 'string')
    Column.create(header_id: "#{new_header.id}", label: 'Vyska_pohladavky', type_id: '4', datatyp: 'string')
    Column.create(header_id: "#{new_header.id}", label: 'Typ_platitela', type_id: '1', datatyp: 'string')

    Summary.create(dataset_id: "#{dataset.id}", header: "Vyska_pohladavky", min: 10.38, max: 41926.7, median: 715.28, mean: 715.28)

    dataset.headers.first.columns.each do |column|
      if column.type_id == 5
        AnalyzeFunction.new.delay.count_lat_long(dataset,column)
      end
    end


  end
end