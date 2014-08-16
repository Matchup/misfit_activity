require "misfit_activity/version"
require 'httparty'

module MisfitActivity

  class Client
    attr_accessor :token, :status_code
    BASE_URL = "https://api.misfitwearables.com/move/resource/v1/"

    include HTTParty

    def initialize(token)
      @token = token
    end

    def profile
      resource_path = "user/me/profile"

    end

    def device
      resource_path = "user/me/device"

    end


    def activity_on_date(date)
      resource_path = "user/me/activity/summary"
      url = BASE_URL + resource_path

      query = {
        start_date: date,
        end_date: date,
        detail: true
      }

      response = HTTParty.get(url, query: query, headers: get_auth_header)
      return parse_activities(response, date, date)
    end


    def activity_in_range(start_date, end_date)
      resource_path = "user/asd/activity/summary"
      url = BASE_URL + resource_path

      query = {
        start_date: start_date,
        end_date: end_date,
        detail: true
      }

      response = HTTParty.get(url, query: query, headers: get_auth_header)
      return parse_activities(response, start_date, end_date)
    end


    # private
    def get_auth_header
      { 'Authorization' => "Bearer #{self.token}" }
    end

    def parse_activities(response, start_date, end_date)
      if response.code != 200
        return wrap_error(response)
      end

      results = []
      activities = response.parsed_response["summary"]

      (start_date..end_date).each do |date|
        result = (activities || []).find{ |r| r["date"] == date.to_s } || {}

        activity = {
          date:     date,
          steps:    result["steps"]    || 0,
          distance: result["distance"] || 0,
          calories: result["calories"] || 0
        }

        results.push(activity)
      end

      return wrap_response(results, response)
    end

    def wrap_response(result, response)
      {
        status_code: response.code,
        message: "success",
        data: result,
        raw: response
      }
    end

    def wrap_error(response)
      {
        status_code: response.code,
        message: response.parsed_response["message"],
        data: [],
        raw: response
      }
    end

  end

end
