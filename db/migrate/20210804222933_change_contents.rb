class ChangeContents < ActiveRecord::Migration[6.1]
  def change
    add_column :contents, :name, :string
    add_column :contents, :country, :string
  end
end
