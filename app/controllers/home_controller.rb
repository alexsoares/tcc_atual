
class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
  	session[:i] = 0
  end

  def teste
    @pessoa = Pessoa.where(:id => current_user.pessoa)
   
    respond_to do |format|
     format.js 
    end	
  end

  def my_places
    respond_to do |format|               
      format.js
    end
  end


  def locais

    respond_to do |format|
     format.js 
    end	
  end

  def tabs
    respond_to do |format|
     format.js 
    end	
  end

  def map_release

    @nome = params[:nome]
    @rua = params[:endereco]
    @latitude = params[:lat]
    @longitude = params[:lng]
    respond_to do |format|
      format.js
    end
  end

  def new_release
    respond_to do |format|
      format.html
      format.js
    end
  end
end
