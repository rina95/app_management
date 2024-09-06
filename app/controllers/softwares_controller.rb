class SoftwaresController < ApplicationController
  before_action :find_software, only: %i(show edit update delete)

  def index
    @search= Software.ransack params[:q]
    @softwares= @search.result.order(created_at: :desc).page params[:page]
  end

  def show
  end

  def new
    @software = Software.new
  end
  
  def create
    @software = Software.new software_params
    if @software.save
      flash[:success] = "software successfully created"
      redirect_to @software
    else
      render :new
    end
  end

  def import
    if params[:file].present?
      Software.import(params[:file])
      redirect_to softwares_path, notice: "Softwares imported successfully."
    else
      redirect_to softwares_path, alert: "Please upload a CSV file."
    end
  end

  def edit
  end

  def update
    if @software.update_attributes(software_params)
      flash[:success] = "software was successfully updated"
      redirect_to @software
    else
      render :edit
    end
  end
  
  def destroy
    if @software.destroy
      flash[:success] = 'software was successfully deleted.'
      redirect_to softwares_url
    else
      flash[:error] = 'Fail to delete!'
      redirect_to softwares_url
    end
  end
  
  private
  def software_params
    params.require(:software).permit(Software::PARAMS)
  end

  def find_software
    @software = Software.find_by_id params[:id]
  end
end
