class EquationController < ApplicationController
  require 'net/http'
  require "uri"
  require 'json'
  
  def home
  end

  def new_linear
    respond_to do |format|
      format.js
    end
  end

  def new_quadratic
    respond_to do |format|
      format.js
    end
  end

  # HTTP POST
  # do a post service to backend sinatra app
  # use net/http
  def solve_linear
    unless params[:a].blank? || params[:b].blank?
      @equation = "#{params[:a]}x + #{params[:b]} = 0"
      url = 'http://0.0.0.0:4567/solve'
      data = { "equation" => {"type" => "linear", "a" => "#{params[:a]}", "b" => "#{params[:b]}"} }.to_json
      res = http_post(url, data)
      @answer = json_response(res)
    else
      render '_linear', notice: "fields can't be blank!"
    end
  end
  
  # HTTP POST
  def solve_quad
    # #
    # @json = { "equation" => {"type" => "quadratic", "a" => "#{params[:a]}", "b" => "#{params[:b]}", "c" => "#{params[:c]}"} }
    # respond_to do |format|
    #   format.json { render :json => @json}
    # end
    # #
    unless params[:a].blank? || params[:b].blank? || params[:c].blank?
      @equation = "#{params[:a]}x + #{params[:b]} = 0"
      url = 'http://0.0.0.0:4567/solve'
      data = { "equation" => {"type" => "quadratic", "a" => "#{params[:a]}", "b" => "#{params[:b]}", "c" => "#{params[:c]}"} }.to_json
      res = http_post(url, data)
      @answer = json_response(res)
    else
      render '_quad', notice: "fields can't be blank!"
    end
  end

  private
  
  # POST json method
  def http_post url, data
    uri = URI.parse(URI::escape(url))
    headers = {'Content-Type' =>'application/json'}
    request = Net::HTTP::Post.new(uri.request_uri, headers)
    request.body = data
    #request["Authorization"] ='SOMEAUTH'
    Net::HTTP.new(uri.host, uri.port).start {|http| http.request(request) }
    rescue Errno::ECONNREFUSED => e
      raise e
  end

  def json_response(res)
    case res
    when Net::HTTPSuccess, Net::HTTPRedirection
      # OK
      result = JSON.parse(res.body) # response body
      raise "Web service error" if result.has_key? 'Error'
      result['Success'] #data
    else
      res.value  # non-success response
    end
  end

end
