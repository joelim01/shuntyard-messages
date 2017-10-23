class ApplicationController < ActionController::API
  include Knock::Authenticable
  rescue_from ApiExceptions::BaseException, :with => :render_error_response

  def render_error_response(error)
    render json: error, serializer: ApiExceptionsSerializer, status: 200
  end

end
