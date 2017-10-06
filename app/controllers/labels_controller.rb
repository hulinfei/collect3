class LabelsController < ApplicationController
  before_action :set_lable, only: [:show, :edit, :update, :destroy]

  # GET /lables
  # GET /lables.json
  def index
    @labels = Label.all
  end

  # GET /lables/1
  # GET /lables/1.json
  def show
  end

  # GET /lables/new
  def new
    @lable = Lable.new
  end

  # GET /lables/1/edit
  def edit
  end

  # POST /lables
  # POST /lables.json
  def create
    @lable = Lable.new(lable_params)

    respond_to do |format|
      if @lable.save
        format.html { redirect_to @lable, notice: 'Lable was successfully created.' }
        format.json { render :show, status: :created, location: @lable }
      else
        format.html { render :new }
        format.json { render json: @lable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lables/1
  # PATCH/PUT /lables/1.json
  def update
    respond_to do |format|
      if @lable.update(lable_params)
        format.html { redirect_to @lable, notice: 'Lable was successfully updated.' }
        format.json { render :show, status: :ok, location: @lable }
      else
        format.html { render :edit }
        format.json { render json: @lable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lables/1
  # DELETE /lables/1.json
  def destroy
    @lable.destroy
    respond_to do |format|
      format.html { redirect_to lables_url, notice: 'Lable was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lable
      @lable = Lable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lable_params
      params.require(:lable).permit(:name, :number)
    end
end
