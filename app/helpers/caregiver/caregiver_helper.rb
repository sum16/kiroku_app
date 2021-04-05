
module Caregiver::CaregiverHelper
  require "html_builder"
  include HtmlBuilder
  
  def number_of_unprocessed_message
    markup do |m|
      m.a(href: inbound_caregiver_messages_path) do
      m << "新規お問い合わせ"
      anchor_text =
        if(c = FamilyMessage.unprocessed.count) > 0
        "(#{c})"
        else
        ""
        end
      m.span(
      anchor_text, id: "number_of_unprocessed_messages",
      "data-path" => caregiver_messages_count_path
      )
      end
    end
  end
end
