class Api::V1::RestaurantsController < ApplicationController
  def get_restaurants_from_yelp_by_city
    uri = URI.parse(uri_string)
    request = Net::HTTP::Get.new(uri)
    request["Authorization"] = "Bearer #{ENV['token']}"

    response = Net::HTTP.start(uri.hostname, uri.port, {use_ssl: uri.scheme == "https"}) do |http|
      http.request(request)
    end

    businesses = response.body

    render json: businesses
  end

  private

  def uri_string
    uri = "https://api.yelp.com/v3/businesses/search?limit=20&location=#{params[:city]}"
    if params[:sort_by] == "rating"
      uri += '&sort_by=rating'
    end
    if params[:price]
      uri += "&price=#{params[:price]}"
    end
    return uri
  end

end
