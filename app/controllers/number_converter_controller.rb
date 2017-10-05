class NumberConverterController < ApplicationController
  def index
    # if we are submitted the form
    if !params.empty?
      # Get parameters and convert to integer
      safe_params = params.permit(:number, :base)
      @number = safe_params[:number].to_i
      @base = safe_params[:base].to_i

      # Initialise result object
      @number_conversion = NumberConversion.new(input_number: @number, base: @base )

      # Store conversion if user inputted something
      if @number > 0 || @base > 0
        @number_conversion = NumberConversion.create(input_number: @number, base: @base )
        @result = @number_conversion.result
      end

      # Get conversion history
      @history = NumberConversion.all
    end
  end

  def show
    # Get the base
    @base = params[:base].to_i
  end

  def destroy
    # Get the ID
    history = NumberConversion.find(params[:id])

    # Delete the record
    history.destroy

    redirect_to root_url
  end
  
end
