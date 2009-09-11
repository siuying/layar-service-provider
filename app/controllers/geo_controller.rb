require 'digest/sha1'
require 'geokit'

class GeoController < ApplicationController
  
  def index
    userId = params[:userId]
    developerId = params[:developerId]
    developerHash = params[:developerHash]
    timestamp = params[:timestamp]
    layerName = params[:layerName]
    lat = params[:lat].to_f
    lng = params[:lon].to_f
    radius = (params[:radius] || "2500").to_f / 1000.0
    
    # developerHashCorrect = Digest::SHA1.hexdigest(developerId + timestamp)
    # if developerHash != developerHashCorrect
    #   render :text => "no permission", :status => 403
    #   return
    # end

    current = Geokit::LatLng.new(lat, lng)
    points = Point.find(:all, :origin =>[lat, lng], :within => radius, :conditions=>{ :group => layerName })

    hotspots = points.collect() do |p|
      poi = p.to_poi
      poi[:distance] = p.distance_to(current)
      poi
    end

    result = {:layer => layerName, :errorCode => "0", :errorString => "ok", :hotspots => hotspots}
    result.to_json
  end
end
