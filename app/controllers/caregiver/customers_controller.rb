class Caregiver::CustomersController < Caregiver::Base

  protect_from_forgery :except => [:destroy]
  
def index 
  @customers = Customer.order(:family_name_kana, :given_name_kana).page(params[:page])
end

def new
  @customer_form = Caregiver::CustomerForm.new
end

def create 
  @customer_form = Caregiver::CustomerForm.new
  @customer_form.assign_attributes(params[:form])
  if @customer_form.save
    flash.notice = "顧客を追加しました"
    redirect_to action: "index"
  else
    render action: "new"
  end
end

def update 
  @customer_form = Caregiver::CustomerForm.new(Customer.find(params[:id]))
  @customer_form.assign_attributes(params[:form])
  if @customer_form.save
    flash.notice = "顧客を更新しました"
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
  @customer_form = Caregiver::CustomerForm.new
  @customer = Customer.find(params[:id])
end


end
