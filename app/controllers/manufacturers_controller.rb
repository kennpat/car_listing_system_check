class ManufacturersController < ApplicationController

  def index
    @manufactuers = Manufacturer.all
  end

  def new
    @manufacturer = Manufacturer.new

  end

  def create
    @manufacturer = Manufacturer.new(new_params)
    if @manufacturer.save
        redirect_to root_path, notice: "Manufacturer successfully added"
    else
        render :new
    end
  end

  private

  def new_params
    params.require(:manufacturer).permit(:name, :nation)
  end

end
