class SupportProcessRecordsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_support_process_record, only: %i[ show edit update destroy ]

  def index
    @support_process_records = SupportProcessRecord.all
  end

  def show
  end

  def new
    @support_process_record = SupportProcessRecord.new
  end

  def edit
  end

  def create
    @support_process_record = SupportProcessRecord.new(support_process_record_params)

    respond_to do |format|
      if @support_process_record.save
        format.html { redirect_to @support_process_record, notice: "Support process record was successfully created." }
        format.json { render :show, status: :created, location: @support_process_record }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @support_process_record.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @support_process_record.update(support_process_record_params)
        format.html { redirect_to @support_process_record, notice: "Support process record was successfully updated." }
        format.json { render :show, status: :ok, location: @support_process_record }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @support_process_record.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @support_process_record.destroy
    respond_to do |format|
      format.html { redirect_to support_process_records_url, notice: "Support process record was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_support_process_record
      @support_process_record = SupportProcessRecord.find(params[:id])
    end


    def support_process_record_params
      params.require(:support_process_record).permit(:title, :name, :contents)
    end
end
