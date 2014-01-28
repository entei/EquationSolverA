class EquationController < ApplicationController
  require 'httparty'
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
  # use httparty
  def solve_linear
    unless params[:a].blank? || params[:b].blank?
      @equation = "#{params[:a]}x + #{params[:b]} = 0"
      url = 'http://0.0.0.0:4567/solve'
      data = { equation: { type: 'linear', a: params[:a], b: params[:b] } }.to_json
      res_body = json_response(http_post(url, data))
      @answer = res_body["success"]
      @error = res_body["error"]
    else
      flash.now[:error] = "fields can't be blank!"
      render '_linear'
    end
  end
  
  # HTTP POST
  def solve_quad
    unless params[:a].blank? || params[:b].blank? || params[:c].blank?
      @equation = "#{params[:a]}x + #{params[:b]} = 0"
      url = 'http://0.0.0.0:4567/solve'
      data = { equation: { type: 'quadratic', a: params[:a], b: params[:b], c: params[:c] } }.to_json
      res_body = json_response(http_post(url, data))
      @answer = res_body["success"]
      @error = res_body["error"]
    else
      flash.now[:error] = "fields can't be blank!"
      render '_quad'
    end
  end

  private
  
  # POST json method
  def http_post url, data
    headers = { 'Content-Type' => 'application/json' } 
    HTTParty.post(url, :body => data, :headers => headers)
    rescue Errno::ECONNREFUSED => e
      raise e
  end

  def json_response(res)
    case res.code
    when 200...300
      # OK
      JSON.parse(res.body) # response body
    when 301, 302, 303, 307
      raise "Redirect Error"
    when 400...500
      # authorization error
      # ...
    when 500...600
      raise "Web service error"
    else
      raise "A transmission error"
    end
  end

end
