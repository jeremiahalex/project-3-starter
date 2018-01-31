module DeviseHelper
  def devise_error_messages!
    @messages = ""
    if resource.errors.full_messages.any?
      @messages += "<h5>Please correct the following error(s):</h5>"
      @messages += "<ol>"
      resource.errors.full_messages.each do |message|
        # flash.now[:alert] = message
        @messages += '<li>' + message + '</li>'
      end
      @messages += "</ol>"
    end
    @messages.html_safe
  end
end
