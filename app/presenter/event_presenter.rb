class EventPresenter < ModelPresenter
  delegate :title, :description, to: :object
  delegate :number_with_delimiter, to: :view_context

  def application_start_time
    object.application_start_time.strftime("%Y-%m-%d %H:%M")
  end

  def application_end_time
    object.application_end_time.strftime("%Y-%m-%d %H:%M")
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


end