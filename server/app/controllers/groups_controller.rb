class GroupsController < ApplicationController

  def index
    # TODO: send back all the groups that can be seen
    # if params[:tags]
    #
    # end
    @groups = Group.all
    respond_to do |format|
      format.json { render json: @groups.as_json(include: :tags) }
    end
  end

  def create
    # TODO: update db with the newly created group
    respond_to do |format|
      format.json { render json: { status: 'create group success', id: 1 } }
    end
  end

  def show
    # TODO: get a specific group using params[]
    respond_to do |format|
      format.json { render json: { status: 'get specific group success', id: 1 } }
    end
  end
end
