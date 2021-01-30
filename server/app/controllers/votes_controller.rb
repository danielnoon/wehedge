class VotesController < ApplicationController
  def index
    # TODO: get votes for a specific pick
    respond_to do |format|
      format.json { render json: { tag: "all votes for specific pick for specific group test" } }
    end
  end

  def create
    # TODO: create new db entry for votes, relate to specific pick (which is related to specific group)
    respond_to do |format|
      format.json { render json: { tag: "new vote for specific pick for specific group test" } }
    end
  end

  def destroy
    # TODO: create new db entry for votes, relate to specific pick (which is related to specific group)
    respond_to do |format|
      format.json { render json: { tag: "vote for specific pick in specific group deleted test" } }
    end
  end
end
