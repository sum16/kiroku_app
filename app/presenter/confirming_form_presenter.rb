class ConfirmingFormPresenter 
require "html_builder"
include HtmlBuilder

attr_reader :form_builder, :view_context
delegate :label, :hidden_field, :object, to: :form_builder

def initialize(form_builder, view_context)
  @form_builder = form_builder
  @view_context = view_context
end

#def initialize(object, view_context)
 # @object = object
  #@view_context = view_context
#end

def notes
  ""
end

def text_field_block(name, label_text, options = {})
  markup(:div, class: "input-block") do |m|
    m << decorated_label(name, label_text)
    if options[:disabled]
      m.div( class: "field-value readonly")
    else
      m.div( class: "field-value")
      m << hidden_field(name, options)
    end
  end
end

def date_field_block(name, label_text, options = {})
  markup(:div, class: "input-block") do |m|
    m << decorated_label(name, label_text)
    m.div(object.send(name), class: "field-value")
    m << hidden_field(name, options)
  end
end

def drop_dowwn_list_block(name, label_text, choices, options = {})
  markup(:div, class: "input-block") do |m|
    m << decorated_label(name, label_text)
    m.div(object.send(name), class: "field-value")
    m << hidden_field(name, options)
  end
end

def decorated_label(name, label_text)
  label(name, label_text)
end


def text_area_block(name, label_text, options = {})
    markup(:div) do |m|
      m << decorated_label(name, label_text)
      value = name
     #object.send(name)
      m.div(class: "field-value") do
        #改行文字を反映
      m << ERB::Util.html_escape(value).gsub(/\n/, "<br>")
      end
      m << hidden_field(name, options)
 #   m << error_messages_for(name)
    end
end

end
