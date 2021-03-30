class Caregiver::CustomersController < Caregiver::Base

  protect_from_forgery :except => [:destroy]

def index 
  @search_form = Caregiver::CustomerSearchForm.new(search_params)
  #@customers = Customer.order(:family_name_kana, :given_name_kana).page(params[:page])
  @customers = @search_form.search.page(params[:page])
end

private def search_params
  params[:search]&.permit([:family_name, :given_name, :family_name_kana, :given_name_kana, :gender])
end

def new
  @customer_form = Caregiver::CustomerForm.new
end

def create 
  @customer_form = Caregiver::CustomerForm.new
  @customer_form.assign_attributes(params[:form])
  if @customer_form.save
    flash.notice = "利用者を追加しました"
    redirect_to action: "index"
  else
    flash.now.alert = "入力に誤りがあります。"
    render action: "new"
  end
end

def update 
  @customer_form = Caregiver::CustomerForm.new(Customer.find(params[:id]))
  @customer_form.assign_attributes(params[:form])
  if @customer_form.save
    flash.notice = "利用者を更新しました"
    redirect_to action: "index"
  else
    flash.now.alert = "入力に誤りがあります。"
    render action: "edit"
  end
end

def destroy
  customer = Customer.find(params[:id])
  customer.destroy!
  flash.notice = "顧客アカウントを削除しました"
  redirect_to :caregiver_staff_member_customers
end


def show
  @customer = Customer.find(params[:id])
end

def edit
  @customer_form = Caregiver::CustomerForm.new(Customer.find(params[:id]))
end

#  @customer.build_home_address unless @customer.home_address
#@customer.build_work_address unless @customer.work_address
#@customer.assign_attributes(customer_params)
#@customer.home_address.assign_attributes(home_address_params)
#@customer.work_address.assign_attributes(work_address_params)
# @customer ||= Customer.new(gender: "male")

private

  def customer_params
    params.require(:customer).permit(:family_name, :given_name, :family_name_kana, :given_name_kana, :gender)
  end

  def home_address_params
    params.require(:home_address).permit(:postal_code, :prefecture, :city, :address1, :address2)
  end

  def work_address_params
    params.require(:work_address).permit(:postal_code, :prefecture, :city, :address1, :address2, :company_name)
  end



end
