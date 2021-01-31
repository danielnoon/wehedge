class MembersController < ApplicationController
  def index
    # TODO: Query database in order to get all members of a group and send them back.
    @users = Group.find(params[:group_id]).users

    respond_to do |format|
      format.json { render json: @users.as_json }
    end
  end

  def create
    # TODO: Add a member to a particular group via database query.
    @user_id = params[:user]
    @group = params[:group_id]
    @contribution = params[:contribution]

    id_array = []
      user_ids = Group.find(@group).users.select("users.id")
      user_ids.each do |x|
        id_array.push(x[:id])
      end

      if !(id_array.include?(@user_id))
        GroupsUsers.create(group_id: @group, user_id: @user_id, contribution: @contribution)
      end

    respond_to do |format|
      format.json { render json: { status: "success" } }
    end

  end

  def destroy
    # TODO: Delete a particular member from a group via database query.

    @group = params[:group_id]
    @user_id = params[:id]

    ActiveRecord::Base.connection.execute("DELETE FROM groups_users WHERE group_id = #{@group} AND user_id = #{@user_id}")

    respond_to do |format|
      format.json { render json: { status: "success" } }
    end
  end
end
