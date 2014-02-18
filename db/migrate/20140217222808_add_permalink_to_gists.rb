class AddPermalinkToGists < ActiveRecord::Migration
  def change
    add_column :gists, :permalink, :string, length: 32

    add_index :gists, :permalink
  end
end
