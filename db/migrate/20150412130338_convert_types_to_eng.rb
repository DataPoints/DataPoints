class ConvertTypesToEng < ActiveRecord::Migration
  def change
    ActiveRecord::Base.connection.execute('TRUNCATE types RESTART IDENTITY')

    eng = ['N/A', 'E-mail', 'Date', 'Number', 'Location', 'Person']
    eng.each do |typeName|
      Type.create(name: typeName)
    end
  end
end