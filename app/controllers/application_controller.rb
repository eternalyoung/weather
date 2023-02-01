class ApplicationController < ActionController::API
  def health
    render json: { status: "ok" }
  end

  rescue_from "ActiveRecord::RecordNotFound" do |exception|
    @exception = exception.message
    render "errors/404", status: 404
  end
end
