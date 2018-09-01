class ReadingsController < ApplicationController
  before_action :set_reading, only: [:show, :edit, :update, :destroy]
  before_action :set_device

  # GET /readings
  def index
    @readings = @device.readings.all
  end

  # GET /readings/1
  def show
  end

  # GET /readings/new
  def new
    @reading = @device.readings.new
  end

  # GET /readings/1/edit
  def edit
  end

  # POST /readings
  def create
    @reading = @device.readings.new(reading_params)

    if @reading.save
      redirect_to @reading, notice: 'Reading was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /readings/1
  def update
    if @reading.update(reading_params)
      redirect_to @reading, notice: 'Reading was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /readings/1
  def destroy
    @reading.destroy
    redirect_to readings_url, notice: 'Reading was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reading
      @reading = Reading.find(params[:id])
    end

    def set_device
      @device = Device.find(params[:device_id])
    end

    # Only allow a trusted parameter "white list" through.
    def reading_params
      params.require(:reading).permit(:device_uid, :datetime, :data, :device_id)
    end
end
