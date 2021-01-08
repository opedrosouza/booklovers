# frozen_string_literal: true

class Utils::Alert::Component < ViewComponent::Base
  def initialize(message: nil, type: nil)
    @message = message
    @type = type
  end

  def change_alert_css(type)
    if type == 'success'
      'alert-success'
    elsif type == 'alert'
      'alert-danger'
    elsif type == 'error'
      'alert-danger'
    end
  end

  def render?
    !@message.nil?
  end
end
