class MessagePresenter < ModelPresenter
  delegate :subject, :body, to: :object

  def type 
    case object
    when FamilyMessage
      "問い合わせ"
    when CaregiverMessage
      "返信"
    else
      raise
    end
  end

  def sender
    case object
    when FamilyMessage
      object.family.family_name + "" + object.family.given_name
    when CaregiverMessage
      object.caregiver.name
    else
      raise
    end
  end

  def truncated_subject
    view_context.truncate(subject, length: 20)
  end


  def receiver
    view_context.truncate(subject, length: 20)
  end

  def created_at
    if object.created_at > Time.current.midnight
      object.created_at.strftime("%H:%M:%S")
    elsif object.created_at > 5.months.ago.beginning_of_month
      object.created_at.strftime("%m/%d %H:%M")
    else
      object.created_at.strftime("%Y/%m/%d %H:%M")
    end
  end

  def formatted_body
    ERB::Util.html_escape(body).gsub(/\n/, "<br>").html_safe
  end

  def tree 
    expand(object.root || object)
  end

  private def expand(node)
    markup(:ul) do |m|
      m.li do
        if node.id == object.id 
          m.strong(node.subject)
        else
          m << link_to(node.subject, view_context.caregiver_message_path(node))
        end
        node.children.each do |c|
          m << expand(c)
        end
      end
    end
  end

end


