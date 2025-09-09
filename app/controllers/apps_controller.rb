class AppsController < ApplicationController
  before_action :set_app, only: %i[ show edit update destroy ]

  # GET /apps or /apps.json
  def index
    @apps = App.all
  end

  # GET /apps/1 or /apps/1.json
  def show
    # @payments = @app.payments.order(created_at: :desc)
  end

  # GET /apps/new
  def new
    @app = Current.user.apps.new
  end

  # GET /apps/1/edit
  def edit
  end

  # POST /apps or /apps.json
  def create
    @app = Current.user.apps.new(app_params)

    respond_to do |format|
      if @app.save
        format.html { redirect_to @app, notice: "App was successfully created." }
        format.json { render :show, status: :created, location: @app }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apps/1 or /apps/1.json
  def update
    respond_to do |format|
      if @app.update(app_params)
        format.html { redirect_to @app, notice: "App was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @app }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apps/1 or /apps/1.json
  def destroy
    @app.destroy!

    respond_to do |format|
      format.html { redirect_to apps_path, notice: "App was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app
      @app = Current.user.apps.includes(:api_keys).find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def app_params
      params.expect(app: [ :title, :status, :decsription ])
    end
end
