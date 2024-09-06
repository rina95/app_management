class LibrariesController < ApplicationController
  before_action :find_library, only: %i(show edit update delete)

  def index
    @search= Library.ransack params[:q]
    @librarys= @search.result.order(created_at: :desc).page params[:page]
  end

  def show
  end

  def new
    @library = Library.new
  end
  
  def create
    @library = Library.new library_params
    if @library.save
      flash[:success] = "Library successfully created"
      redirect_to @library
    else
      render :new
    end
  end

  def import
    if params[:file].present?
      Library.import(params[:file])
      redirect_to libraries_path, notice: "Libraries imported successfully."
    else
      redirect_to libraries_path, alert: "Please upload a CSV file."
    end
  end

  def edit
  end

  def update
    if @library.update_attributes(library_params)
      flash[:success] = "Library was successfully updated"
      redirect_to @library
    else
      render :edit
    end
  end
  
  def destroy
    if @library.destroy
      flash[:success] = 'library was successfully deleted.'
      redirect_to libraries_url
    else
      flash[:error] = 'Fail to delete!'
      redirect_to libraries_url
    end
  end
  
  private
  def library_params
    params.require(:library).permit(Library::PARAMS)
  end

  def find_library
    @library = Library.find_by_id params[:id]
  end
end
