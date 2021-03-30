class Family::AccountForm

  include ActiveModel::Model 

  attr_accessor :family
  delegate :persisted?, to: :family

  def initialize(family = nil)
    @family = family
    
    @family.build_home_address unless @family.home_address
    @family.build_work_address unless @family.work_address
  end

  def assign_attributes(params= {})
    @params = params
    family.assign_attributes(family_params)
    family.home_address.assign_attributes(home_address_params)
    family.work_address.assign_attributes(work_address_params)
  end

  def save
    #トランザクション処理
    ActiveRecord::Base.transaction do
      family.save!
      family.home_address.save!
      family.work_address.save!
    end
  end

end
