class Family::AccountsController < Family::Base
  before_action :set_family, only: %i[ show edit ]

  def show
  end

  def edit 
  end

  def update
    family = Family.find_by(id: current_family.id)
    if family.update(family_params) 
       flash.notice = "アカウント情報を更新しました"
       redirect_to family_account_path(current_family)
    else
       flash.now.alert = "入力に誤りがあります"
       render :edit 
    end
  end

  def confirm
    @family = Family.find_by(id: current_family.id)
    @family.update!(family_params) 
    #バリデーションを通す
    if @family.valid?
       render "confirm"
    else
       flash.now.alert = "入力に誤りがあります。"
       render :edit
    end
  end

  private

  def family_params
    params.require(:form).permit(:family_name, :given_name, :family_name_kana, :given_name_kana, :relationship, :address, :care_recipitent_name, :gender)
  end

  def set_family
    @family = Family.find_by(id: current_family.id)
  end
  
end
