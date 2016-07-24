require 'httparty'

class ZipcodeAPI

  def initialize
    @api_key = "40MbMr3aoCHonOpf6zFb7Ymbr7hUdlSilEu86yjvb1TyPjNWTs81rucSCuNQQF9c"
  end


  def get_nearby_zipcodes(zipcode, radius_preference)
    p "PRINTINGGGG"
    p radius_preference
    p zipcode
    response = HTTParty.get("https://www.zipcodeapi.com/rest/#{@api_key}/radius.json/#{zipcode}/#{radius_preference}/mile")
    nearby_zipcodes = []
    p response
    response["zip_codes"].each do |z|
      nearby_zipcodes << z["zip_code"]
    end
    nearby_zipcodes
  end

end
