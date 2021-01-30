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
    respond_to do |format|
      format.json { render json: { status: 'login success' } }
    end
  end
end
