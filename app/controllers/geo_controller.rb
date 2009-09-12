require 'digest/sha1'
require 'geokit'

class GeoController < ApplicationController
  include GeoHelper
  
  def index
    userId = params[:userId]
    developerId = params[:developerId]
    developerHash = params[:developerHash]
    timestamp = params[:timestamp]
    layerName = params[:layerName]
    lat = params[:lat].to_f
    lng = params[:lon].to_f
    radius = (params[:radius] || "2500").to_f / 1000.0
    
    if validate_hash(developerId, timestamp, developerHash)
      render :text => "no permission", :status => 403
      return
    end

    current = Geokit::LatLng.new(lat, lng)
    points = Point.find(:all, :origin =>[lat, lng], :within => radius, :conditions=>{ :group => layerName })
    hotspots = points.collect() do |point|
      point_to_poi(point, current)
    end

    result = {:nextPageKey => "#{lat},#{lng}", :morePages => false, :layer => layerName, :errorCode => 0, :errorString => "ok", :hotspots => hotspots}
    render :text => result.to_json
  end
end
