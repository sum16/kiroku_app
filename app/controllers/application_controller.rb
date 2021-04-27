class ApplicationController < ActionController::Base
  layout :set_layout

  class Forbidden < ActionController::ActionControllerError
  end

  class IpAdressRejected < ActionController::ActionControllerError
  end
  
  include ErrorHandlers if Rails.env.production?

  private

  def set_layout
    if params[:controller].match(%r{\A(|caregiver|family|)/})
      Regexp.last_match[1]
    end
  end

  #xhrメソッド = ajaxによるリクエストかどうかを判別
  def  reject_non_xhr
    raise ActionController::BadRequest unless request.xhr?
  end

end
