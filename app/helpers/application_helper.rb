module ApplicationHelper
  
  def markup(tag_name = nil, options = {})
    root = Nokogiri::HTML::DocumentFragment.parse("")
    Nokogiri::HTML::Builder.with(root) do |doc|
      if tag_name
        doc.method_missing(tag_name, options) do
          yield(doc)
        end
      else
        yield(doc)
      end
    end
    root.to_html.html_safe
  end
   
  def document_title
    if @title.present?
      "#{@title} - KIROKU"
    else
      "KIROKU"
    end
  end

  #男性か女性を返すメソッド
  def judge_gender(gender)
    case gender
    when "male"
      "男性"
    when "female"
      "女性"
    else
      ""
    end
  end
  
end
