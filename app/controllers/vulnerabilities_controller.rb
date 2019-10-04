class VulnerabilitiesController < ApplicationController
  before_action :set_vulnerability, only: [:show, :update, :destroy]

  # GET /vulnerabilities
  def index
    @vulnerabilities = Vulnerability.all

    render json: @vulnerabilities
  end

  # GET /vulnerabilities/1
  def show
    render json: @vulnerability
  end

  # POST /vulnerabilities
  def create
    @vulnerability = Vulnerability.new(vulnerability_params)

    if @vulnerability.save
      render json: @vulnerability, status: :created, location: @vulnerability
    else
      render json: @vulnerability.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vulnerabilities/1
  def update
    if @vulnerability.update(vulnerability_params)
      render json: @vulnerability
    else
      render json: @vulnerability.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vulnerabilities/1
  def destroy
    @vulnerability.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vulnerability
      @vulnerability = Vulnerability.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def vulnerability_params
      params.require(:vulnerability).permit(:package_id, :description)
    end
end
