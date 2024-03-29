class CluesController < ApplicationController

  def index
    session[:location] = params[:location]
    session[:answer] = params[:answer]
    @teams = Team.all
    @cluenum = Clue.find_by(location: params[:location]).number
    @result = check_answer
  end

  def correct
    params[:location] = session[:location]
    params[:answer] = session[:answer]
    team = Team.find_by(name: params[:team])
    team.stations.create(number: params[:cluenum])
    @result = check_answer
    if @result[:clue].number == team.start
      render 'done'
    end
    flash[:moveon] = true
    render 'index'  
  end

  def new
    @clue = Clue.new
  end

  def all
    @clues = Clue.all
  end

  def edit
    @clue = Clue.find_by(number: params[:number])
  end

  def update
    Clue.find_by(number: params[:clue][:number]).update_attributes(clue_params)
    flash[:message] = "Success"
    redirect_to '/admin/edit/' + params[:clue][:number]
  end

  def create
    Clue.create(clue_params)
    flash[:message] = "Success"
    redirect_to '/admin/new'
  end

  private

  def clue_params
    params.require(:location, :answer)
  end

  def check_answer
  	clue = Clue.find_by(location: params[:location])
  	if clue && clue.unlock_digest == params[:answer]
  		num = clue.number
  		next_clue = Clue.find_by(number: ((num%8)+1))
      return {correct: true, clue: next_clue}
  	else
  	  return {correct: false, clue: clue}
  	end
  end

    def clue_params
      params.require(:clue).permit(:number, :location, :body, :unlock_digest)
    end
end