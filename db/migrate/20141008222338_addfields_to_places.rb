class AddfieldsToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :pessoa_id, :integer
    add_column :places, :nota, :float
  end
end
