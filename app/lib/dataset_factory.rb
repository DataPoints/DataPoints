class DatasetFactory

  def firstDataset(id)

    puts id.to_s
    dataset = Dataset.new
    dataset.name = "Demo dataset"
    dataset.description = "Toto je tvoj prvy dataset. Umozni ti vyskusat funkcionalitu nasej apky"
    dataset.link = "---------"
    dataset.storage = "app/lib/FirstDataset/FirstDataset.csv"
    dataset.user_id = id
    dataset.downloadProgress=100
    dataset.downloadstatus='1'
    dataset.status = 'P'
    dataset.data_table_name = "first_datasets"
    dataset.save(validate:false)
    puts "Dataset sa ulozil"

    new_header = Header.new
    new_header.dataset_id = dataset.id
    new_header.origin = true
    new_header.save

    Column.create(header_id: "#{new_header.dataset_id}", label: 'Obchodne_meno', type_id: '1',datatyp: 'string')
    Column.create(header_id: "#{new_header.dataset_id}", label: 'PSC', type_id: '1',datatyp: 'string')
    Column.create(header_id: "#{new_header.dataset_id}", label: 'Ulica', type_id: '5',datatyp: 'string')
    Column.create(header_id: "#{new_header.dataset_id}", label: 'Mesto_Obec', type_id: '5',datatyp: 'string')
    Column.create(header_id: "#{new_header.dataset_id}", label: 'ICO', type_id: '1',datatyp: 'string')
    Column.create(header_id: "#{new_header.dataset_id}", label: 'Vyska_pohladavky', type_id: '4',datatyp: 'string')
    Column.create(header_id: "#{new_header.dataset_id}", label: 'Typ_platitela', type_id: '4',datatyp: 'string')

    Summary.create( dataset_id:"#{dataset.id}", header:"Vyska_pohladavky", min:10.38, max:41926.7, median:715.28, mean:715.28 )

  end
end