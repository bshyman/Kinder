require 'httparty'

class ZipcodeAPI

  def initialize
    @api_key = "t6U2dKZo0mAZ8rMDi62mO71EX2bicr5GxZILKHaK3KKcbwPtCRQrZR6WUhf6JkMg"
  end


  def get_nearby_zipcodes(zipcode, radius_preference)
    response = HTTParty.get("https://www.zipcodeapi.com/rest/#{@api_key}/radius.json/#{zipcode}/#{radius_preference}/mile")
    nearby_zipcodes = []
    response["zip_codes"].each do |z|
      nearby_zipcodes << z["zip_code"]
    end
    nearby_zipcodes
  end

end
