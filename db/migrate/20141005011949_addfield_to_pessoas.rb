class AddfieldToPessoas < ActiveRecord::Migration
  def change
    add_column :pessoas, :numero, :integer
  end
end
