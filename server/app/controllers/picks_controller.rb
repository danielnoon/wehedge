class PicksController < ApplicationController

  def index
    # TODO: get all picks for a group
    respond_to do |format|
      format.json { render json: { tag: "all picks in a group test" } }
    end
  end

  def show
    # TODO: get a specific pick within a group
    respond_to do |format|
      format.json { render json: { tag: "specific pick for group test" } }
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
    respond_to do |format|
      format.json { render json: { tag: "delete pick for group test" } }
    end
  end
end
