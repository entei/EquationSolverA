class EquationController < ApplicationController
  include EquationHelper
  
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
      data = { "type" => "linear", "a" => "#{params[:a]}", "b" => "#{params[:b]}" }.to_json
      res = EquationHelper::MyHTTP.post(url, data)
      @answer = json_response(res)
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
      data = { "type" => "quadratic", "a" => "#{params[:a]}", "b" => "#{params[:b]}", "c" => "#{params[:c]}" }.to_json
      res = EquationHelper::MyHTTP.post(url, data)
      @answer = json_response(res)
    else
      flash.now[:error] = "fields can't be blank!"
      render '_quad'
    end
  end

  private

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
