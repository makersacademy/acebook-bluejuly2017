class ApplicationController < ActionController::Base
  include Clearance::Controller
  # is this something we added?
  protect_from_forgery with: :exception
end
