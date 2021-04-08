class Caregiver::CustomerInformationsController < Caregiver::Base
  before_action :set_customer_information, only: %i[ show edit update destroy ]

  # GET /customer_informations or /customer_informations.json
  def index
    @customer_informations = CustomerInformation.all
  end

  # GET /customer_informations/1 or /customer_informations/1.json
  def show
  end

  # GET /customer_informations/new
  def new
    @customer_information = CustomerInformation.new
  end

  # GET /customer_informations/1/edit
  def edit
  end

  # POST /customer_informations or /customer_informations.json
  def create
    @customer_information = CustomerInformation.new(customer_information_params)

    respond_to do |format|
      if @customer_information.save
        format.html { redirect_to caregiver_customer_information_path(@customer_information), notice: "Customer information was successfully created." }
        format.json { render :show, status: :created, location: @caregiver_customer_information }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @caregiver_customer_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customer_informations/1 or /customer_informations/1.json
  def update
    respond_to do |format|
      if @customer_information.update(customer_information_params)
        format.html { redirect_to caregiver_customer_information_path(@customer_information), notice: "Customer information was successfully updated." }
        format.json { render :show, status: :ok, location: @caregiver_customer_information }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @caregiver_customer_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer_informations/1 or /customer_informations/1.json
  def destroy
    @customer_information.destroy
    respond_to do |format|
      format.html { redirect_to caregiver_customer_informations_path, notice: "Customer information was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_information
      @customer_information = CustomerInformation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_information_params
      params.require(:customer_information).permit(:title, :body)
    end
end
