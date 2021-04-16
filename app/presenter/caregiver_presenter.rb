class CaregiverPresenter < ModelPresenter

  #職員の停止フラグのon/offを表現

  def suspended_mark
    object.suspended? ? view_context.raw("&#x2611;") : view_context.raw("&#x2610;")
  end
end

