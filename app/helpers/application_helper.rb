module ApplicationHelper

  def markup
    root = Nokogiri::HTML::DocumentFragment.parse('')
    Nokogiri::HTML::Builder.with(root) do |doc|
      yield(doc)
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
  
end
