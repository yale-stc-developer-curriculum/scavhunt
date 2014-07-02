class CluesController < ApplicationController

  def index
  	@result = check_answer
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
      return {correct: true, clue: next_clue}
  	else
  	  return {correct: false, clue: clue}
  	end
  end

end