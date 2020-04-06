class AddCountryidToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :country_id, :integer
  end
end
