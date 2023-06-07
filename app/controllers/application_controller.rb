class ApplicationController < ActionController::Base
  helper_method :logo

  def logo
    @logo_thumb = LogoSearch.new.logo_image.logo_thumb_url
  end

  def welcome
  end
end
