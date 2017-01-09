class NoiseLevelsController < ApplicationController
  before_action :set_noise_level, only: [:show, :edit, :update, :destroy]

  # GET /noise_levels
  # GET /noise_levels.json
  def index
    @noise_levels = NoiseLevel.all
  end

  # GET /noise_levels/1
  # GET /noise_levels/1.json
  def show
  end

  # GET /noise_levels/new
  def new
    @noise_level = NoiseLevel.new
  end

  # GET /noise_levels/1/edit
  def edit
  end

  # POST /noise_levels
  # POST /noise_levels.json
  def create
    @noise_level = NoiseLevel.new(noise_level_params)

#    if @noise_level.save
      ActionCable.server.broadcast('noise_level', level: @noise_level.value)
#    end

  end

  # PATCH/PUT /noise_levels/1
  # PATCH/PUT /noise_levels/1.json
  def update
    respond_to do |format|
      if @noise_level.update(noise_level_params)
        format.html { redirect_to @noise_level, notice: 'Noise level was successfully updated.' }
        format.json { render :show, status: :ok, location: @noise_level }
      else
        format.html { render :edit }
        format.json { render json: @noise_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /noise_levels/1
  # DELETE /noise_levels/1.json
  def destroy
    @noise_level.destroy
    respond_to do |format|
      format.html { redirect_to noise_levels_url, notice: 'Noise level was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_noise_level
      @noise_level = NoiseLevel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def noise_level_params
      params.require(:noise_level).permit(:value)
    end
end
