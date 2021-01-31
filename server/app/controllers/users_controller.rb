class UsersController < ApplicationController
  # registering new users (POST)
  def new
    # TODO: update DB with POST Data from
    respond_to do |format|
          format.json { render json: { status: 'register success' } }
        end
  end

  # logging in to an existing user (POST)
  def login
    # TODO: see if you exist, if exists, make sure password matches with bcrypt

    @user = User.where(username: params[:username])

    if @user
      if User.where(username: params[:username], password: params[:password])
        respond_to do |format|
          format.json { render json: { user_id: @user[:id] } }
        end
      end
    end
    
  end
end
