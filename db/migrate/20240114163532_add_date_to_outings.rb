class AddDateToOutings < ActiveRecord::Migration[7.0]
  def change
    add_column :outings, :date, :string
  end
end
