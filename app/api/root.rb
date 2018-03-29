require './app/api/v1/root'
require './app/api/error_formatter'

module Api
  class Root < ::Grape::API
    prefix :api
    error_formatter :json, ErrorFormatter

    rescue_from :all do |e|
      eclass = e.class.to_s
      opts = { response_type: "error" }
      opts[:message] = e.message unless opts[:message]
      opts[:error_code] = e.error_code if e.try(:error_code).present?
      opts[:trace] = e.backtrace unless ENV['RACK_ENV'] == 'production'
      status = case
               when eclass.match('RecordNotFound'), e.message.match(/unable to find/i).present?
                 404
               else
                 (e.respond_to? :status) && e.status ||
                    (e.respond_to? :status_code) && e.status_code ||
                    500
               end
      Rack::Response.new(opts.to_json, status, {
        'Content-Type' => "application/json",
        'Access-Control-Allow-Origin' => '*',
        'Access-Control-Request-Method' => '*',
      }).finish
    end


    mount ::Api::V1::Root
  end
end

