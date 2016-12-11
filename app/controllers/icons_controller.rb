class IconsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_icon_set

  def new
    @icon = @icon_set.icons.build
  end

  def create
    @icon = @icon_set.icons.build(icon_params)

    if @icon.save
      flash[:success] = "You successfully created a new icon."

      redirect_to icon_set_path(@icon_set)
    else
      render :new
    end
  end

  protected

    def set_icon_set
      @icon_set = current_user.icon_sets.find(params[:icon_set_id])
    end

    def icon_params
      form_params = params.require(:icon).permit(:name, :unicode, :svg)
      form_params.merge(unicode: hex_to_integer(form_params[:unicode]))

      form_params
    end

    def hex_to_integer(value)
      value.to_i
    end
end
