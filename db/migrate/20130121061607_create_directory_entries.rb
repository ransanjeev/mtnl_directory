class CreateDirectoryEntries < ActiveRecord::Migration
  def change
    create_table :directory_entries do |t|
      t.string :name
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
