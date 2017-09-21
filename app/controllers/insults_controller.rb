class InsultsController < ApplicationController

  def list

    @schedules = Schedules.all

    respond_to do |format|

      format.html # list.html.erb

      format.json { render :json => @schedules.to_json }

    end

  end

end