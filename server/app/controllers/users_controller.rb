class UsersController < ApplicationController
  before_action :authorized, only: [:auto_login]

  # registering new users (POST)
  def new
    # TODO: update DB with POST Data from

    @username_exists = User.where("users.username = '#{params[:username]}'")

    if @username_exists != []
      respond_to do |format|
        format.json { render json: { status: 'username already exists' } }
      end
    else
      @user = User.create(username: params[:username], password: params[:password], firstname: params[:first_name], lastname: params[:last_name], wallet: 0, join_date: Time.now)
      if @user.valid?
        token = encode_token({user_id: @user.id})
        respond_to do |format|
          format.json { render json: { user: @user, token: token } }
        end
      else
        respond_to do |format|
          format.json { render json: { status: 'register failed, invalid user and pass' } }
        end
      end
    end
        
  end

  # logging in to an existing user (POST)
  def login
    # TODO: see if you exist, if exists, make sure password matches with bcrypt

    @user = User.where(username: params[:username])

    if @user && @user.authenticate(params[:password])
      token = encode_token({ user_id: @user.id })
      respond_to do |format|
        format.json { render json: { user: user, token: token } }
      end
    end
  end

    private

    def user_params
      params.permit(:username, :password)
    end
end
