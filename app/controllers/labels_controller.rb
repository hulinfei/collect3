class LabelsController < ApplicationController
  before_action :set_label, only: [:show, :edit, :update, :destroy]
   load_and_authorize_resource
  layout 'admin'

  # GET /lables
  # GET /lables.json
  def index
    @labels = Label.all
  end

  #排序
    def descending
      @labels = Label.all
      @labels = @labels.order_by( :number => 'desc')
      render :index
    end

    def ascending
      @labels = @labels.order_by( :number => 'asc')
    end

  # GET /lables/1
  # GET /lables/1.json
  def show
  end

  # GET /lables/new
  def new
    @label = Label.new
  end

  # GET /lables/1/edit
  def edit
  end

  # POST /lables
  # POST /lables.json
  def create
    @label = Label.new(label_params)

    respond_to do |format|
      if @label.save
        format.html { redirect_to @label, notice: 'Label was successfully created.' }
        format.json { render :show, status: :created, location: @label }
      else
        format.html { render :new }
        format.json { render json: @label.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lables/1
  # PATCH/PUT /lables/1.json
  def update
    respond_to do |format|
      if @label.update(label_params)
        format.html { redirect_to @label, notice: 'Label was successfully updated.' }
        format.json { render :show, status: :ok, location: @label }
      else
        format.html { render :edit }
        format.json { render json: @label.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lables/1
  # DELETE /lables/1.json
  def destroy
    @label.destroy
    respond_to do |format|
      format.html { redirect_to labels_url, notice: 'Label was successfully destroyed.' }
      format.json { head :no_content }
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_label
      @label = Label.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def label_params
      params.require(:label).permit(:name, :number)
    end
end
