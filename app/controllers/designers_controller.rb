class DesignersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_designer, only: [:edit, :update, :destroy]

  def index
    @designers = Designer.all
  end

  def new
    @designer = Designer.new
  end

  def create
    @designer = Designer.new(designer_params)

    if @designer.save
      flash[:success] = "You successfully created a new designer."

      redirect_to designers_path
    else
      render :new
    end
  end

  def update
    if @designer.update(designer_params)
      flash[:success] = "You successfully updated the designer."

      redirect_to designers_path
    else
      render :edit
    end
  end

  def destroy
    @designer.destroy

    flash[:success] = "You successfully deleted the designer and related icon sets."

    redirect_to designers_path
  end

  protected

    def set_designer
      @designer = Designer.find(params[:id])
    end

    def designer_params
      params.require(:designer).permit(:name, :email, :website)
    end
end
