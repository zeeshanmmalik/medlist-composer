class PrescriptionsController < ApplicationController
  before_filter :authenticate_pharmacist!
  before_action :set_prescription, only: [:show, :edit, :update, :destroy]
  before_action :set_patient, only: [:show]

  # GET /prescriptions
  # GET /prescriptions.json
  def index
    @prescriptions = Prescription.all
  end

  # GET /prescriptions/1
  # GET /prescriptions/1.json
  def show
    @font_size = params[:font_size] || ''
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "#{@prescription.id}",
               template: 'prescriptions/show.pdf.haml',
               layout: 'layouts/pdf_plain.haml',
               show_as_html: params[:debug].present?, 
               disposition: 'inline',
               margin: {:top                => "0.50in",                     # default 10 (mm)
                        :bottom             => "0.50in",
                        :left               => "0.50in",
                        :right              => "0.50in"},
               page_size: 'Letter',
               #header: {:html => { :template => 'prescriptions/_header.pdf.haml' }},
               footer: { :center => 'Page [page] of [topage]' }
      end
    end
  end

  # GET /prescriptions/new
  def new
    @prescription = Prescription.new
  end

  # GET /prescriptions/1/edit
  def edit
  end

  # POST /prescriptions
  # POST /prescriptions.json
  def create
    @prescription = Prescription.new(prescription_params)

    respond_to do |format|
      if @prescription.save
        format.html { redirect_to @prescription, notice: 'Prescription was successfully created.' }
        format.json { render action: 'show', status: :created, location: @prescription }
      else
        format.html { render action: 'new' }
        format.json { render json: @prescription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prescriptions/1
  # PATCH/PUT /prescriptions/1.json
  def update
    respond_to do |format|      
      if @prescription.update(prescription_params)
        format.html { redirect_to @prescription, notice: 'Prescription was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @prescription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prescriptions/1
  # DELETE /prescriptions/1.json
  def destroy
    @prescription.destroy
    respond_to do |format|
      format.html { redirect_to prescriptions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prescription
      @prescription = Prescription.find(params[:id])
    end

    def set_patient
      @patient = Patient.find(params[:patient_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prescription_params
      params.require(:prescription).permit(:pateint_id, :pharmacist_id, :physician, :base_template_id, :alergies, :note, :status,
                                            drugs_attributes: [:id,
                                                               :generic_name,
                                                               :strength,
                                                               :brand_name,
                                                               :purpose,
                                                               :am_check, :am_time,
                                                               :noon_check, :noon_time,
                                                               :supper_check, :supper_time,
                                                               :bedtime_check, :bedtime_time,
                                                               :order_no, :_destroy,
                                                               instructions_attributes: [:id,
                                                                                         :line,
                                                                                         :_destroy]])
    end
end
