class GroupsController < ApplicationController

  def index
    # TODO: send back all the groups that can be seen
    # if params[:tags]
    #   @tags = Group.tags.where()
    # end
    @groups = Group.all
    build = []
    @groups.each do |group|
      g_Json = group.as_json(only: %i[id name description total_money total_invested])
      g_Json[:tags] = group.tags
      build.push(g_Json)
    end

    respond_to do |format|
      format.json { render json: build.map { |o| Hash[o.each_pair.to_a] }.to_json }
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
