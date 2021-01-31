class TagsController < ApplicationController
  def all_index
    @tags = Tag.all
    respond_to do |format|
      format.json { render json: @tags.to_json(only: %i[id name]) }
    end
  end

  def index
    @tags = Group.find(params[:group_id]).tags
    respond_to do |format|
      format.json { render json: @tags.to_json(only: %i[id name]) }
    end
  end

  def create
    # TODO: send back newly created connection of tag to group
    respond_to do |format|
      format.json { render json: { success: "new tag created test" } }
    end
  end

  def destroy
    # TODO: remove connection of tag to group
    respond_to do |format|
      format.json { render json: { tag: "tag removed from group test" } }
    end
  end
end
