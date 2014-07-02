require 'pry'

class Api::V1::CluesController < ApplicationController
  respond_to :json

before_filter :cors_preflight_check
after_filter :cors_set_access_control_headers

# For all responses in this controller, return the CORS access control headers.

def cors_set_access_control_headers
  headers['Access-Control-Allow-Origin'] = '*'
  headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
  headers['Access-Control-Max-Age'] = "1728000"
end

# If this is a preflight OPTIONS request, then short-circuit the
# request, return only the necessary headers and return an empty
# text/plain.

def cors_preflight_check
  if request.method == :options
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version'
    headers['Access-Control-Max-Age'] = '1728000'
    render :text => '', :content_type => 'text/plain'
  end
end

  def respond
  	res = check_answer
  	if res
  		@correct = { :status => "correct", :body => res.body }
  		binding.pry
  		respond_with @correct
  	else
  	    @wrong = { :status => "wrong"}
    	respond_with @wrong
    end
  end

  private

  def clue_params
    params.require(:location, :answer)
  end

  def check_answer
  	clue = Clue.find_by(location: params[:location])
  	if clue && clue.unlock_digest == params[:answer]
  		num = clue.number
  		next_clue = Clue.find_by(number: (num+1)%10)
	else
		false
	end
  end

end