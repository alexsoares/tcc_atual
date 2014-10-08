class CreateAvaliacaos < ActiveRecord::Migration
  def change
    create_table :avaliacaos do |t|
      t.string :nome
      t.float :longitude
      t.float :latitude
      t.float :nota

      t.timestamps
    end
  end
end
