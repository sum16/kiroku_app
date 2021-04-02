class Family::AccountForm

  include ActiveModel::Model 

  attr_accessor :family, :inputs_home_address, :inputs_work_address
  delegate :persisted?, :save, to: :family

  def initialize(family)
    @family = family
  end

end
