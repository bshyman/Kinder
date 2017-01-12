require 'httparty'

class ZipcodeAPI

  def initialize
    @api_key = ENV['ZIPCODEAPIKEY']
  end


  def get_nearby_zipcodes(zipcode, radius_preference)

    response = HTTParty.get("https://www.zipcodeapi.com/rest/#{@api_key}/radius.json/#{zipcode}/#{radius_preference}/mile")
    nearby_zipcodes = []
    response["zip_codes"].each do |z|
      nearby_zipcodes << z["zip_code"]
    end
    p nearby_zipcodes
  end

end
