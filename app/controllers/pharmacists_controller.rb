class PharmacistsController < ApplicationController
  before_action :set_pharmacist, only: [:show, :edit, :update, :destroy]

  # GET /pharmacists
  # GET /pharmacists.json
  def index
    @pharmacists = Pharmacist.all
  end

  # GET /pharmacists/1
  # GET /pharmacists/1.json
  def show
  end

  # GET /pharmacists/new
  def new
    @pharmacist = Pharmacist.new
  end

  # GET /pharmacists/1/edit
  def edit
  end

  # POST /pharmacists
  # POST /pharmacists.json
  def create
    @pharmacist = Pharmacist.new(pharmacist_params)

    respond_to do |format|
      if @pharmacist.save
        format.html { redirect_to @pharmacist, notice: 'Pharmacist was successfully created.' }
        format.json { render action: 'show', status: :created, location: @pharmacist }
      else
        format.html { render action: 'new' }
        format.json { render json: @pharmacist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pharmacists/1
  # PATCH/PUT /pharmacists/1.json
  def update
    respond_to do |format|
      if @pharmacist.update(pharmacist_params)
        format.html { redirect_to @pharmacist, notice: 'Pharmacist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pharmacist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pharmacists/1
  # DELETE /pharmacists/1.json
  def destroy
    @pharmacist.destroy
    respond_to do |format|
      format.html { redirect_to pharmacists_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pharmacist
      @pharmacist = Pharmacist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pharmacist_params
      params.require(:pharmacist).permit(:first_name, :last_name)
    end
end
