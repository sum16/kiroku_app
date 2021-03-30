class Family::AccountsController < Family::Base
  def show
    @family = current_family
  end
end
