class Api::V1::CluesController < ApplicationController
  respond_to :json

  def respond
  	res = check_answer
  	if res
  		@correct = { :status => "correct", :body => res.body }
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