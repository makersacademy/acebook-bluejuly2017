class RoomsController < ApplicationController
  def show
  	@messages = Messages.all?
  end
end
