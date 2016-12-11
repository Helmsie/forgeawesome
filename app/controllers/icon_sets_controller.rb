class IconSetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_icon_set, only: [:show, :edit, :update, :destroy]

  def index
    @icon_sets = IconSet.all
  end

  def show
    @icons = @icon_set.icons.order(unicode: :asc)
  end

  def new
    @icon_set = current_user.icon_sets.new
  end

  def create
    @icon_set = current_user.icon_sets.create(icon_set_params)

    if @icon_set.save
      flash[:success] = "You successfully created a new icon set."

      redirect_to icon_sets_path
    else
      render :new
    end
  end

  def update
    if @icon_set.update(icon_set_params)
      flash[:success] = "You successfully updated the icon set."

      redirect_to icon_sets_path
    else
      render :edit
    end
  end

  def destroy
    @icon_set.destroy

    flash[:success] = "You successfully deleted the icon set."

    redirect_to icon_sets_path
  end

  protected

    def set_icon_set
      @icon_set = current_user.icon_sets.find(params[:id])
    end

    def icon_set_params
      form_params = params.require(:icon_set).permit(
        :name, :designer_id, :designed_for, :css_prefix, :icon_css_prefix, :website
      )

      form_params.merge!(slug: form_params[:name].parameterize)
      form_params
    end
end
