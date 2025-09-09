class ApiKeysController < ApplicationController
  before_action :set_app, only: %i[index new create]
  before_action :set_api_key, only: %i[show destroy]

  def index
    @api_keys = @app.api_keys.order(created_at: :desc)
  end

  def new
    @api_key = @app.api_keys.new
  end

  def create
    @api_key = @app.api_keys.new(api_key_params)
    if @api_key.save
      redirect_to app_path(@app), notice: "API key created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    # @api_key đã được set
  end

  def destroy
    app = @api_key.app
    @api_key.destroy
    redirect_to app_path(app), notice: "API key deleted"
  end

  private

  def set_app
    # chỉ gọi ở index/new/create → có params[:app_id]
    @app = App.find(params[:app_id])
  end

  def set_api_key
    @app = App.find(params[:app_id])
    @api_key = @app.api_keys.find(params[:id])
  end

  def api_key_params
    params.require(:api_key).permit(:title) # chỉnh theo schema của bạn
  end
end
