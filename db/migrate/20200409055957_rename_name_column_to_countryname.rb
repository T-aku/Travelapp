class RenameNameColumnToCountryname < ActiveRecord::Migration[6.0]
  def change
     rename_column :countries, :name, :countryname
  end
end
