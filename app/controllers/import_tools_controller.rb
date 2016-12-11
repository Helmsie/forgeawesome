class ImportToolsController < ApplicationController

  def show
    @icons = @icons.order(unicode: :asc)
  end

  def new

  end

  def create
    uploaded_io = params[:SVG]

    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
  end
end
