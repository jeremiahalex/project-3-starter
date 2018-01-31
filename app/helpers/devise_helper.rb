module DeviseHelper
  def devise_error_messages!
    if resource.errors.full_messages.any?
      flash[:alert] = array_to_flash(resource.errors.full_messages)
    end
  end

  private

  # Method to convert errors messages in hash to flash
  def array_to_flash(full_msg)
    return_string = ''
    if full_msg.kind_of?(Array)
      if ! full_msg.empty?
        full_msg.each { |x| return_string += x.to_s + '<br>' }
      end
    end
    return_string.gsub(/[\'\"\[\]]/, '')
  end
end
