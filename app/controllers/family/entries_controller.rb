class Family::EntriesController < Family::Base
  def create 
    event = Event.published.find(params[:event_id])
   
    #app/servicesフォルダにコードの１部を移動
    case Family::EntryAcceptor.new(current_family).accept(event)
    when :accepted
       flash.notice = "イベントに申し込みました。"
    when :full
      flash.alert = "イベントへの申し込みが上限に達しました。"
    when :closed
      flash.alert = "イベントへの申し込み期間が終了しました。"
    end
    redirect_to family_events_path	
  end

  #patch
  def cancel 
    event = Event.published.find(params[:event_id])
    if event.application_start_time.try(:<, Time.current)
      flash.alert = "イベントへの申し込みをキャンセルできません。(受付期間終了)"
    else
      entry = event.entries.find_by!(family_id: current_family.id)
      entry.update_column(:canceled, true)
      flash.notice = "イベントへの申し込みをキャンセルしました。"
    end
    redirect_to family_events_path	
  end
  
end
