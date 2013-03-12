class ApplicationController < ActionController::Base
  protect_from_forgery
  
  rescue_from ActiveRecord::RecordNotFound, :with => :bad_record
  rescue_from ActiveModel::MassAssignmentSecurity::Error, :with => :parameter_errors

  protected 

  def render_json(json)
    callback = params[:callback]
    response = begin
      if callback
        "#{callback}(#{json});"
      else
        json
      end
    end
    render({:content_type => :js, :text => response})
  end

  def bad_record
    render_json({:message => "No Record Found!", :status => 404}.to_json)
  end
  
  def parameter_errors
    render_json({:errors => "You have supplied invalid parameter list.", :status => 404}.to_json)
  end
end
