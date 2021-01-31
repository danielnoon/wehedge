class GroupsController < ApplicationController

  def index
    # TODO: send back all the groups that can be seen
    if params[:q]
      key = "%#{params[:q].downcase}%"
      @groups = Group.where('lower(name) LIKE ?', key).or(Group.where('lower(description) LIKE ?', key))
    else
      @groups = Group.all
    end

    build = []
    @groups.each do |group|
      g_Json = group.as_json(only: %i[id name description total_money total_invested])
      if get_tags(g_Json, group)
        build.push(g_Json)
      end
    end

    respond_to do |format|
      format.json { render json: build.map { |o| Hash[o.each_pair.to_a] }.to_json }
    end
  end

  def create
    @group = Group.new(name: params[:name], description: params[:description], total_money: 0, total_invested: 0)
    if params[:tags]
      params[:tags].each do |tag_id|
        @group.tags << Tag.find(tag_id)
      end
    end
    @group.save!
    respond_to do |format|
      format.json { render json: { id: @group[:id] } }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: Group.find(params[:id]).as_json(only: %i[id name description total_money total_invested]) }
    end
  end

  private

  def get_tags( g , graw)
    if params[:tags]
      if params[:tags].include? ','
        g[:tags] = graw.tags.where(id: params[:tags].split(',')).as_json(only: %i[id name])
      else
        # can be nil
        g[:tags] = graw.tags.find_by_id(params[:tags]).as_json(only: %i[id name])
      end
    else
      g[:tags] = graw.tags.as_json(only: %i[id name])
    end
    not (g[:tags].nil?)
    end
end
