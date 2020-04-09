class RenameNameColumnToProductname < ActiveRecord::Migration[6.0]
  def change
    rename_column :products, :name, :productname
  end
end
