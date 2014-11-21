class PessoasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pessoa, only: [:show, :edit, :update, :destroy]

  # GET /pessoas
  # GET /pessoas.json
  def index
    @pessoas = Pessoa.all
  end

  # GET /pessoas/1
  # GET /pessoas/1.json
  def show
    respond_to do |format|               
      format.js
      format.html
    end
  end


  # GET /pessoas/new
  def new
    if current_user.pessoa.present?
      @pessoa = Pessoa.find_by_user_id(current_user.id)
      render :action => 'edit'
    else
    @pessoa = Pessoa.new
    end
  end

  # GET /pessoas/1/edit
  def edit
  end

  # POST /pessoas
  # POST /pessoas.json
  def create
    @pessoa = Pessoa.new(pessoa_params)
    @pessoa.user_id = current_user.id
    endereco = BuscaEndereco.cep(@pessoa.cep.to_i)
    endereco_montado = "#{endereco[:tipo_logradouro]} #{endereco[:logradouro]}, #{endereco[:bairro]} - #{endereco[:cidade]}"
    @pessoa.endereco = endereco_montado
    respond_to do |format|
      if @pessoa.save
        format.html { redirect_to root_path, notice: 'Pessoa was successfully created.' }
        format.json { render :show, status: :created, location: @pessoa }
      else
        format.html { render :new }
        format.json { render json: @pessoa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pessoas/1
  # PATCH/PUT /pessoas/1.json
  def update
    respond_to do |format|
      if @pessoa.update(pessoa_params)
        format.html { redirect_to @pessoa, notice: 'Pessoa was successfully updated.' }
        format.json { render :show, status: :ok, location: @pessoa }
      else
        format.html { render :edit }
        format.json { render json: @pessoa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pessoas/1
  # DELETE /pessoas/1.json
  def destroy
    @pessoa.destroy
    respond_to do |format|
      format.html { redirect_to pessoas_url, notice: 'Pessoa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pessoa
      @pessoa = Pessoa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pessoa_params
      params.require(:pessoa).permit(:nome, :idade, :endereco, :cep, :numero, :user_id, :interess_ids => [])
    end
end
