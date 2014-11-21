class Pessoa < ActiveRecord::Base
  validates :nome, :endereco, :presence => true 
  validates :user_id, :presence => true, :uniqueness => true
  belongs_to :user
  has_and_belongs_to_many :interesses
  geocoded_by :endereco
  after_validation :geocode
  has_many :places
protected
  def possui_user?
    user = current_user.pessoa.present?
  end
end
