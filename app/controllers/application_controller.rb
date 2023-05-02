# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend
  include ErrorHandling
  include Authentication
  include Authorization

  around_action :switch_locale

  def switch_locale(&action)
    locale = locale_from_url || I18n.default_locale
    I18n.with_locale locale, &action
  end

  def locale_from_url
    locale = params[:locale]
    I18n.available_locales.map(&:to_s).include?(locale) ? locale : nil
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
