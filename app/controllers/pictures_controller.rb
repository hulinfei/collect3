class PicturesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_picture, only: [ :edit, :update, :destroy]
  load_and_authorize_resource
  layout 'admin'



  # GET /pictures/1/edit
  def edit
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @article = Article.find(params[:article_id])

    @picture = @article.pictures.new(picture_params)

    respond_to do |format|
      if @picture.save
        format.html { redirect_to article_path(@article), notice: 'Picture was successfully created.' }
        format.json { render :show, status: :created, location: @picture }
      else
        format.html { render :new }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pictures/1
  # PATCH/PUT /pictures/1.json
  def update
    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to article_path(Article.find(params[:article_id])), notice: 'Picture was successfully updated.' }
        format.json { render :show, status: :ok, location: @picture }
      else
        format.html { render :edit }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to article_path(Article.find(params[:article_id])), notice: 'Picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Article.find(params[:article_id]).pictures.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.require(:picture).permit(:image)
    end
end
