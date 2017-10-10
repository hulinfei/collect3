class PhotosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_photo, only: [:edit, :update, :destroy]
  # load_and_authorize_resource
  layout 'admin'

  # GET /lables
  # GET /lables.json
  def index
    @photos = Picture.all.page params[:page]
  end


  # GET /lables/1/edit
  def edit
  end


  # PATCH/PUT /lables/1
  # PATCH/PUT /lables/1.json
  def update
      if @photo.update(photo_params)
        redirect_to photos_path, notice: 'Label was successfully updated.'
      else
        render :edit
      end
    
  end

  # DELETE /lables/1
  # DELETE /lables/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_path, notice: 'Label was successfully destroyed.' }
      format.json { head :no_content }
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Picture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:image)
    end
end
