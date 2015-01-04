class VehiclesController < ApplicationController

  def index
    @cars = Vehicles.all
  end

  def new
    @car = Vehicle.new
    @manufacturers = Manufacturer.all
    @man_name = []
    @manufacturers.each do |name|
      @man_name << name[:name]
    end

  end

  def create
    @manufacturers = Manufacturer.all
    @man_name = []
    @manufacturers.each do |name|
      @man_name << name[:name]
    end


    @car = Vehicle.new(new_params)
    man_convert = Manufacturer.find_by(name: params["vehicle"][:manufacturer])

    @car[:manufacturer_id] = man_convert.id

    if @car.save
      redirect_to root_path, notice: "Vehicle successfully added"
    else
      render :new
    end
  end

  private

  def new_params
      params.require(:vehicle).permit(:color, :year, :mileage)
  end

end
