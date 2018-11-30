class StaticController < ApplicationController

  def home
    # @nearby_labs = Lab.with_approved_state.where(country_code: current_country.alpha2.downcase).order("RANDOM()").limit(3)
    # @country_labs = @nearby_labs.exists?
    render layout: 'welcome'
  end

  def about; end
  def cookie_policy; end
  def privacy_policy; end
  def tos; end

  def country_guess
    render text: (current_country ? "I think you are in #{current_country}" : "I don't know where you are")
  end

  def api
    render :api, layout: false
  end

  def choose_locale
    render :choose_locale, layout: !request.xhr?
    # if request.xhr?

    # else
    #   redirect_to request.referer, params: { locale: I18n.locale }
    # end
  end

  def version
    render json: {
      env: Rails.env,
      version: VERSION,
      ruby: RUBY_VERSION,
      rails: Rails::VERSION::STRING
    }
  end
end
