# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
end
