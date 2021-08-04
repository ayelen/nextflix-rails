class MeaningOfLifeController < ApplicationController
  before_action :validate_address, only: :show

  def geoip
    @geoip ||= Geoip.new
  end

  def country
    geoip.get_country(request.remote_ip)
  end

  def index
    contents = Content
      .where(country: country)
      .map {|c| { name: c.name }}
    render json: contents
  end

  def show
    content = Content.find(params['id'])
    render json: content
  end
  
  private
  
  def validate_address
    can_access = Content.find(params['id']).country == country
    if(!can_access) 
      return render :status => :unauthorized, :json => ""
    end
  end
end
