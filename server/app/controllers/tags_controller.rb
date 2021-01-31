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
    @tags = params[:tags]

    @tags.each do |tag|

      id_array = []
      tag_ids = Group.find(params[:group_id]).tags.select("tags.id")
      tag_ids.each do |x|
        id_array.push(x[:id])
      end

      if !(id_array.include?(tag))
        GroupsTags.create(group_id: params[:group_id], tag_id: tag)
      end
    end

    respond_to do |format|
      format.json { render json: { status: "complete" } }
    end
  end

  def destroy
    # TODO: remove connection of tag to group

    @group = params[:group_id]
    @tag_id = params[:id]

    ActiveRecord::Base.connection.execute("DELETE FROM groups_tags WHERE group_id = #{@group} AND tag_id = #{@tag_id}")

    respond_to do |format|
      format.json { render json: { status: "success" } }
    end
  end
end
