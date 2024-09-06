class PlansController < ApplicationController
  before_action :find_plan, only: %i(show edit update delete)

  def index
    @search= Plan.ransack params[:q]
    @plans= @search.result.order(created_at: :desc).page params[:page]
  end

  def show
  end

  def new
    @plan = Plan.new
  end
  
  def create
    @plan = Plan.new plan_params
    if @plan.save
      flash[:success] = "plan successfully created"
      redirect_to @plan
    else
      render :new
    end
  end

  def import
    if params[:file].present?
      Plan.import(params[:file])
      redirect_to plans_path, notice: "Plans imported successfully."
    else
      redirect_to plans_path, alert: "Please upload a CSV file."
    end
  end

  def edit
  end

  def update
    if @plan.update_attributes(plan_params)
      flash[:success] = "plan was successfully updated"
      redirect_to @plan
    else
      render :edit
    end
  end
  
  def destroy
    if @plan.destroy
      flash[:success] = 'plan was successfully deleted.'
      redirect_to plans_url
    else
      flash[:error] = 'Fail to delete!'
      redirect_to plans_url
    end
  end
  
  private
  def plan_params
    params.require(:plan).permit(Plan::PARAMS)
  end

  def find_plan
    @plan = Plan.find_by_id params[:id]
  end
end
