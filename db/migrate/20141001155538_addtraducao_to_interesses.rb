class AddtraducaoToInteresses < ActiveRecord::Migration
  def change
    add_column :interesses, :traducao, :string
  end
end
