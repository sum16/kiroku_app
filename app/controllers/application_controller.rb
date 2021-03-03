class ApplicationController < ActionController::Base
  layout :set_layout

  class Forbidden < ActionController::ActionControllerError
  end

  class IpAdressRejected < ActionController::ActionControllerError
  end

  include ErrorHandlers if Rails.env.production?


  private

   def set_layout
    if params[:controller].match(%r{\A(staff|caregiver|care_recipitent)/})
      Regexp.last_match[1]
    end
  end

  def rescue404(e)
    render "errors/not_found", status: 404
  end

  def rescue403(e)
    @exception = e
    render "errors/forbidden", status: 403
  end

  def rescue500(e)
    render "errors/internal_server_error", status: 500
  end

  

end
