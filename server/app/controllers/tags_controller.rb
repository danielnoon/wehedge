class TagsController < ApplicationController
  def all_index
    # TODO: get every single tag, select all from tags table in db, send back tag associated with id, array of objects { name: id }
    respond_to do |format|
      format.json { render json: { tag: "all tags in application test" } }
    end
  end

  def index
    # TODO: get all tags that belong to the given group
    respond_to do |format|
      format.json { render json: { tag: "all tags for group test" } }
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
