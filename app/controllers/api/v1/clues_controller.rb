class Api::V1::CluesController < ApplicationController
  respond_to :json

  def respond
    @response = Clue.first
    @error = { :status => "wrong"}

    respond_with @response
    # respond_with @error
  end

  private

  def clue_params
    params.require(:location, :answer)
  end
end