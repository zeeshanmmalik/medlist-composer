class PatientsController < ApplicationController
  before_filter :authenticate_pharmacist!
  before_action :set_patient, only: [:show, :edit, :update, :destroy, :start_discharge_for, :create_prescription_for]

  # GET /patients
  # GET /patients.json
  def index
    @patients = Patient.all
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
  end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # GET /patients/1/edit
  def edit
  end

  # GET /patients/1/start_discharge_for
  def start_discharge_for
    @base_templates = Template.all
  end

  # GET /patients/1/create_prescription_for
  def create_prescription_for
    @prescription = @patient.prescriptions.new
    @template = Template.find(params[:template_id])
    @prescription.note = @template.note
    @prescription.base_template_id = @template.id
    @prescription.base_template_type = 'base'
    @prescription.pharmacist_id = current_pharmacist.id
    @prescription.save
    @template.drugs.each do |drug|
      pd = @prescription.drugs.create(drug.as_json)
      drug.instructions.each do |ins|
        pd.instructions.create(ins.as_json)
      end
    end

  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)

    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render action: 'show', status: :created, location: @patient }
      else
        format.html { render action: 'new' }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:first_name, :last_name, :mrn, :date_of_birth, :program, :admission_date, :discharge_date, :pharmacist_id)
    end
end
