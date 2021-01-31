class PicksController < ApplicationController

  def index
    # get the pick information
    @picks = Pick.joins(:pick_stocks)
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
    @pick = Pick.new(user_id: params[:user], group_id: params[:group])
    if @pick.save!
      params[:stocks].each do |stock|
        @pickstock = PickStock.new(shares: stock[:amount], pick_id: @pick.id, api_id: nil,
                             category: stock[:type], symbol: stock[:symbol])
        @pickstock.save!
      end
    end
    respond_to do |format|
      format.json { render json: { id: @pick.id } }
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
