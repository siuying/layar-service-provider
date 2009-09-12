module GeoHelper
  def validate_hash(developerId, timestamp, developerHash)
    developerHashCorrect = Digest::SHA1.hexdigest(developerId + timestamp)
    return developerHash == developerHashCorrect
  end

  def point_to_poi(point, ref_point)
    {
       :actions => [], 
       :distance => point.distance_to(ref_point) * 1000,
       :attribution => "data from www.mcdonalds.com.hk",
       :id => "#{name}#{id}",
       :imageURL => nil,
       :lat => (lat * 1000000).to_i,
       :lon => (lng * 1000000).to_i,
       :title => point.name,
       :line2 => point.address,
       :line3 => point.phone,
       :line4 => "",
       :type => 0
    }
  end
end
