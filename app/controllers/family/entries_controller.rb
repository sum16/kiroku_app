class Family::EntriesController < Family::Base
  def create 
    event = Event.published.find(params[:event_id])
    event.entries.create!(family: current_family)
    flash.notice = "イベントに申し込みを受け付けました。"
    redirect_to family_events_path	
  end
end
