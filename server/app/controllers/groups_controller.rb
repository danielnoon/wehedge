class GroupsController < ApplicationController
  def index
    # TODO: send back all the groups that can be seen
    respond_to do |format|
      format.json { 
        render json: { status: 'all groups GET success',
                       groups: [
                         { name: 'Group 1', id: 1 },
                         { name: 'Group 2', id: 2 }
                       ]}
                  }
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
