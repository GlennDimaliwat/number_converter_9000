class NumberConverterController < ApplicationController
  def index
    # Get parameters and convert to integer
    safe_params = params.permit(:input_number, :base)

    # Initialise result object
    @number_conversion = NumberConversion.new(safe_params)
    @number_conversion.save unless safe_params[:input_number].nil? or safe_params[:base].nil?

    # Get conversion history in descending order
    @history = NumberConversion.all.order(created_at: :desc)
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

    # Redirect to home page
    redirect_to root_url
  end
  
end
