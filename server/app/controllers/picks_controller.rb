class PicksController < ApplicationController

  def index
    # TODO: get all picks for a group

    @picks = PickStocks.find_by_sql("select users.*, picks.*, pick_stocks.* from users join picks on users.id = picks.user_id join groups on groups.id = picks.group_id join pick_stocks on picks.id = pick_stocks.pick_id where groups.id = #{params[:group_id]}")

    if @picks != []
      respond_to do |format|
        format.json { render json: @picks.as_json(only: %i[shares id api_id]) }
      end
    else
      respond_to do |format|
        format.json { render json: { response: "no picks" } }
      end
    end
  end

  def show
    # TODO: get a specific pick within a group
    @picks = PickStocks.find_by_sql("select users.*, picks.*, pick_stocks.* from users join picks on users.id = picks.user_id join groups on groups.id = picks.group_id join pick_stocks on picks.id = pick_stocks.pick_id where groups.id = #{params[:group_id]} and picks.id = #{params[:id]}")

    if @picks != []
      respond_to do |format|
        format.json { render json: @picks.as_json(only: %i[shares id api_id]) }
      end
    else
      respond_to do |format|
        format.json { render json: { response: "no picks" } }
      end
    end
  end

  def create
    # TODO: create a new pick in the DB and relate it to this group
    respond_to do |format|
      format.json { render json: { tag: "new pick for group created test" } }
    end
  end

  def destroy
    # TODO: delete a specific pick for a group in the database

    ActiveRecord::Base.connection.execute("DELETE FROM pick_stocks WHERE pick_id = #{params[:id]}")
    ActiveRecord::Base.connection.execute("DELETE FROM votes WHERE pick_id = #{params[:id]}")
    ActiveRecord::Base.connection.execute("DELETE FROM picks WHERE id = #{params[:id]}")

    respond_to do |format|
      format.json { render json: { status: "complete" } }
    end
  end
end
