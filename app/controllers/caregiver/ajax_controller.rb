class Caregiver::AjaxController < ApplicationController

  before_action :check_source_ip_address
  before_action :authorize
  before_action :check_timeout
  before_action :reject_non_xhr
  
  def message_count 
    render plain: FamilyMessage.unprocessed.count
  end

  private def check_source_ip_address
    unless AllowedSource.include?("caregiver", request.ip)
      render plain: "Forbidden", status: 403
    end
  end

  private def current_caregiver_member
    if session[:caregive_id]
      Caregiver.find_by(id: session[:caregiver_id])
    end
  end

  private def authorize
    unless current_caregiver_member && current_caregiver_member.active?
      render plain: "Forbidden", status: 403
    end
  end

  private def check_timeout
    unless session[:last_access_time] && session[:last_access_time] >= Caregiver::Base::TIMEOUT.ago 
      session.delete(:caregiver_id)
      render plain: "Forbidden", status: 403
    end
  end

end
