module ApplicationHelper
  def bootstrap_class_for flash_type
    { success: "alert alert-success", error: "alert alert-danger", alert: "alert alert-warning", notice: "alert alert-info" }[flash_type.to_sym] || flash_type.to_s
  end

  def bootstrap_icon_for flash_type
    { success: "fa fa-check", error: "fa fa-times", alert: "fa fa-exclamation-triangle", notice: "fa fa-exclamation-circle" }[flash_type] || "fa fa-exclamation"
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} alert-dismissible", role: 'alert') do
        concat(content_tag(:button, class: 'close', data: { dismiss: 'alert' }) do
          concat content_tag(:span, '&times;'.html_safe, 'aria-hidden' => true)
          concat content_tag(:span, 'Close', class: 'sr-only')
        end)
        concat message
      end)
    end
    nil
  end
end
