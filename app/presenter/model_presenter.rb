class ModelPresenter

  require "html_builder"
  include HtmlBuilder
  
  attr_reader :object, :view_context
  delegate :raw, :link_to, to: :view_context

  def initialize(object, view_context)
    @object = object
    @view_context = view_context
  end

  def created_at 
    object.created_at.try(:strftime, "%Y/%m/%d %H:%M")
  end

  def updated_at 
    object.updated_at.try(:strftime, "%Y/%m/%d %H:%M")
  end
end
