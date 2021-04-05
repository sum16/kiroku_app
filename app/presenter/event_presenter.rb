class EventPresenter < ModelPresenter
  delegate :title, :description, to: :object
  delegate :number_with_delimiter, :button_to, :current_family, to: :view_context

  def application_start_time
    object.application_start_time.strftime("%Y年%m月%d日 %H時%M分")
  end

  def application_end_time
    object.application_end_time.strftime("%Y年%m月%d日 %H時%M分")
  end

  def max_number_of_participants
    if object.max_number_of_participants
      number_with_delimiter(object.max_number_of_participants)
    end
  end

  def min_number_of_participants
    if object.min_number_of_participants
      number_with_delimiter(object.min_number_of_participants)
    end
  end

  def number_of_applicants
    number_with_delimiter(object.entries.count)
  end

  def registrant 
    object.registrant.name
  end

  def apply_or_cancel_button
    if entry = object.entries.find_by(family_id: current_family.id)
      status = cancellation_status(entry)
      button_to cancel_button_label_text(status),
      [ :cancel, :family, object, :entry ],
      disabled: status != :cancellable, method: :patch, data: { confirm: "本当にキャンセルされますか？"}
      
    else
      status = event_status
      button_to button_label_text(status), [ :family, object, :entry ],
      disabled: status != :available, method: :post, data: { confirm: "本当に申し込みますか？"}

    end
  end

  private def event_status
    if object.application_end_time.try(:<, Time.current)
      :closed
    elsif object.max_number_of_participants.try(:<=, object.applicants.count)
      :full
    else
      :available
    end
  end

  private def button_label_text(status)
    case status
    when :closed
       "募集終了"
    when :full
      "満員"
    else
      "申し込む"
    end
  end

  private def cancellation_status(entry)
    if object.application_end_time.try(:<, Time.current)
      :closed
    elsif entry.canceled?
      :canceled
    else
      :cancellable
    end
  end

  private def cancel_button_label_text(status)
    case status
    when :closed
      "申し込み済み(キャンセル不可)"
    when :canceled
      "キャンセル済み"
    else
      "キャンセルする"
    end
  end

end
