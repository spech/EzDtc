class DtcsController < ApplicationController
  before_action :set_dtc, only: %i[ show edit update destroy ]

  # GET /dtcs or /dtcs.json
  def index
    @dtcs = Dtc.all
  end

  # GET /dtcs/:pCode or /dtcs/:pCode.json
  def show
    
  end

  # GET /dtcs/new
  def new
    @dtc = Dtc.new
  end

  # GET /dtcs/:pCode/edit
  def edit
  end

  # POST /dtcs or /dtcs.json
  def create
    @dtc = Dtc.new(dtc_params)

    respond_to do |format|
      if @dtc.save
        format.html { redirect_to dtc_url(@dtc), notice: "Dtc was successfully created." }
        format.json { render :show, status: :created, location: @dtc }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dtc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dtcs/:pCode or /dtcs/:pCode.json
  def update
    respond_to do |format|
      if @dtc.update(dtc_params)
        format.html { redirect_to dtc_url(@dtc), notice: "Dtc was successfully updated." }
        format.json { render :show, status: :ok, location: @dtc }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dtc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dtcs/:pCode or /dtcs/:pCode.json
  def destroy
    @dtc.destroy

    respond_to do |format|
      format.html { redirect_to dtcs_url, notice: "Dtc was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dtc
      @dtc = Dtc.find_by(pCode: params[:pCode])
    end

    # Only allow a list of trusted parameters through.
    def dtc_params
      params.require(:dtc).permit(:shortText, :pCode, :spnFmi)
    end
end
