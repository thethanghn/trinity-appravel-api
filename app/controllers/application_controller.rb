class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404
  
  def render_404
    render json: {status: 'FAILURE', message: 'record not found', data: nil}, status: :not_found
  end
end
