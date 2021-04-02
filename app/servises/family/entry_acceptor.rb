class Family::EntryAcceptor

  def initialize(family)
      @family = family
    end
  end

  def accept(event_id)
    raise if Time.current < event.application_start_time #万が一開始時間前のイベントが存在した場合に例外を発生させる
    return :closed if Time.current >= event.application_end_time
    ActiveRecord::Base.transaction do 
      event.lock!
      if event.entries.where(family_id: @family.id).exists?
        return :accepted
      elsif max = event.max_number_of_participants
        if event.entries.where(canceled: false).count > max 
          event.entries.create!(family: @family)
          return :accepted
        else
          return :full
        end
      else
        event.entries.create!(family: @family)
        return :accepted
      end
    end
  end
end

end


