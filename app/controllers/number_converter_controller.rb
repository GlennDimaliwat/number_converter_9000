class NumberConverterController < ApplicationController
  def index
    # if we are submitted the form
    if !params.empty? and @base!=1
      safe_params = params.permit(:number, :base)
      @number = safe_params[:number].to_i
      @base = safe_params[:base].to_i

      # Store conversion
      if @number > 0 and @base >= 2
        NumberConversion.create(input_number: @number, base: @base)
      end

      # Get conversion history
      @history = NumberConversion.all
    end
  end

  def show
    # Get the base
    @base = params[:base].to_i
  end
end
