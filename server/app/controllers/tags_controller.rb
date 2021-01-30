class TagsController < ApplicationController
  def index
    # TODO: get every single tag, select all from tags table in db, send back tag associated with id, array of objects { name: id }
    respond_to do |format|
      format.json { render json: { tag: "test" }}
    end
  end
end
