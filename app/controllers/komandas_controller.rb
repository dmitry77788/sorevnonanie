class KomandasController < ApplicationController
  before_action :set_komanda, only: [:show, :edit, :update, :destroy]

  # GET /komandas
  # GET /komandas.json
  def index
    @komandas = Komanda.all
  end

  # GET /komandas/1
  # GET /komandas/1.json
  def show
  end

  # GET /komandas/new
  def new
    @komanda = Komanda.new
  end

  # GET /komandas/1/edit
  def edit
  end

  # POST /komandas
  # POST /komandas.json
  def create
    @komanda = Komanda.new(komanda_params)

    respond_to do |format|
      if @komanda.save
        format.html { redirect_to @komanda, notice: 'Komanda was successfully created.' }
        format.json { render :show, status: :created, location: @komanda }
      else
        format.html { render :new }
        format.json { render json: @komanda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /komandas/1
  # PATCH/PUT /komandas/1.json
  def update
    respond_to do |format|
      if @komanda.update(komanda_params)
        format.html { redirect_to @komanda, notice: 'Komanda was successfully updated.' }
        format.json { render :show, status: :ok, location: @komanda }
      else
        format.html { render :edit }
        format.json { render json: @komanda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /komandas/1
  # DELETE /komandas/1.json
  def destroy
    @komanda.destroy
    respond_to do |format|
      format.html { redirect_to komandas_url, notice: 'Komanda was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_komanda
      @komanda = Komanda.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def komanda_params
      params.require(:komanda).permit(:name)
    end
end
