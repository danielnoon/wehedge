class MembersController < ApplicationController
  def index
    # TODO: Query database in order to get all members of a group and send them back.

    respond_to do |format|
      format.json { render json: { message: "success from index" } }
    end
  end

  def create
    # TODO: Add a member to a particular group via database query.
    respond_to do |format|
      format.json { render json: { message: "success from create" } }
    end

  end

  def destroy
    # TODO: Delete a particular member from a group via database query.
    respond_to do |format|
      format.json { render json: { message: "success from destroy" } }
    end

  end
end
