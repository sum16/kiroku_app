class Caregiver::EntriesController < Caregiver::Base

  def update_all
    entries_form = Caregiver::EntriesForm.new(Event.find(params[:event_id]))
    entries_form .update_all(params)
    flash.notice = "イベント申し込みのフラグを更新しました。"
    redirect_to caregiver_events_path
  end

end
