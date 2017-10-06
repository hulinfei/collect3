class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :allow_without_password, only: [:update]


  # GET /logins
  # GET /logins.json
  def index
    @users = User.all
  end

  # GET /logins/1
  # GET /logins/1.json
  def show
  end

  # GET /logins/new
  def new
    @user = User.new
  end

  # GET /logins/1/edit
  def edit
  end

  # POST /logins
  # POST /logins.json
  def create
    @user = User.new(user_params)
    puts @user
    # redirect_to @user

    respond_to do |format|
      if @user.save
        puts @user.errors
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        puts @user.errors

        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /logins/1
  # PATCH/PUT /logins/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logins/1
  # DELETE /logins/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def allow_without_password
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
          params[:user].delete(:password)
          params[:user].delete(:password_confirmation)
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :username, :password, :password_confirmation, :avatar)
    end
end
