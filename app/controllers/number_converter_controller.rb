class NumberConverterController < ApplicationController
  def index
    # if we are submitted the form
    if !params.empty? and @base!=1
      safe_params = params.permit(:number, :base)
      @number = safe_params[:number].to_i
      @base = safe_params[:base].to_i
    end
  end
end
