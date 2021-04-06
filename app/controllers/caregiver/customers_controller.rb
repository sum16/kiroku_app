class Caregiver::CustomersController < Caregiver::Base

def index 
  @search_form = Caregiver::CustomerSearchForm.new(search_params)
  #@customers = Customer.order(:family_name_kana, :given_name_kana).page(params[:page])
  @customers = @search_form.search.page(params[:page])
end

private def search_params
  params[:search]&.permit([:family_name, :given_name, :family_name_kana, :given_name_kana, :gender])
end

def new
  @customer = Customer.new
  @customer.build_customer_address
end

def create 
   @customer = Customer.new(customer_params)
 if @customer.save!
     flash.notice = "利用情報を追加しました"
   redirect_to caregiver_staff_member_customer_path(current_caregiver_member.id, @customer.id)
  else
    flash.now.alert = "入力に誤りがあります。"
    render :new
  end
end

def show
  @customer = Customer.find(params[:id])
end

def edit
  @customer = Customer.find(params[:id])
end

def update
  @customer = Customer.find(params[:id])
 if @customer.update(customer_params)
  flash.notice = "家族情報を更新しました。"
  redirect_to caregiver_staff_members_path
 else
  flash.now.alert = "入力に誤りがあります。"
  render :new
 end
end

def destroy
  customer = Customer.find(params[:id])
  customer.destroy!
  flash.notice = "顧客アカウントを削除しました"
  redirect_to :caregiver_staff_member_customers
end



private

  def customer_params
    params.require(:customer).permit(:family_name, :given_name, :family_name_kana, :given_name_kana, :gender, 
      customer_address_attributes: [:id, :address1, :address2, :city, :prefecture, :postal_code, :company_name])
  end


end
