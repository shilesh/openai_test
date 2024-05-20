require 'openai'

class WelcomeController < ApplicationController
  def index
  end

  def submit
    @prompt = params[:message]

    # client = OpenAI::Client.new(api_key: ENV['OPENAI_API_KEY'])
    # # @client ||= OpenAI::Client.new

    client = OpenAI::Client.new(
      access_token: ENV['OPENAI_API_KEY'],
      log_errors: true # Highly recommended in development, so you can see what errors OpenAI is returning. Not recommended in production.
    )

    response = client.chat(
      parameters: {
          model: "gpt-3.5-turbo",
          temperature: 0.7,
          top_p: 1,
          frequency_penalty: 0,
          presence_penalty: 0,
          messages: [{role: "user", content: "Describe a character called Anna!"}]
        }
    )
    reply =  response["choices"].map { |c| c["text"] }
    puts reply 

    @response = reply

    render 'index'
  end
end
