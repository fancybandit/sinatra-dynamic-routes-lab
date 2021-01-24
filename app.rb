require_relative 'config/environment'

class App < Sinatra::Base

  get '/reversename/:name' do
    @reversed_name = params[:name].reverse
  end

  get '/square/:number' do
    @square = (params[:number].to_i ** 2).to_s
  end

  get '/say/:number/:phrase' do
    @multiphrase = params[:phrase] * params[:number].to_i
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    word_array = []
    params.map do |word|
      word_array << word[1]
    end
    @five_word_string = "#{word_array.join(" ")}."
  end

  get '/:operation/:number1/:number2' do
    num1 = params[:number1].to_i
    num2 = params[:number2].to_i

    case params[:operation]
    when "add"
      @sum = (num1 + num2).to_s
    when "subtract"
      @difference = (num1 - num2).to_s
    when "multiply"
      @product = (num1 * num2).to_s
    when "divide"
      @quotient = (num1 / num2).to_s
    else
      "Invalid Operation \"#{params[:operation]}\""
    end
  end

end