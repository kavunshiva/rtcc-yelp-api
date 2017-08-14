class Api::V1::RestaurantsController < ApplicationController
  def get_restaurants_from_yelp_by_city
    uri = URI.parse("https://api.yelp.com/v3/businesses/search?location=#{params[:city]}")
    request = Net::HTTP::Get.new(uri)
    request["Authorization"] = "Bearer #{ENV['token']}"

    req_options = {
      use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end

    businesses = response.body

    render json: businesses
  end

end
