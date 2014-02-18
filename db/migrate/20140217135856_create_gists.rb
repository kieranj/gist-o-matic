class CreateGists < ActiveRecord::Migration
  def change
    create_table :gists do |t|
      t.string  :name
      t.text    :code
      t.string  :language
      t.boolean :visible, default: false
      t.timestamps
    end
    
    add_index :gists, :name, unique: true
    add_index :gists, :visible
  end
end
