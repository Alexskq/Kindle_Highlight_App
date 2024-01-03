class HighlightsController < ApplicationController
before_action :initialize_kindle_client

    def index

        @kindle = kind.books

      
    end

    private 

    def initialize_kindle_client
        @kindle = KindleHighlights::Client.new(
            email_address: ENV["AMAZON_EMAIL"],
            password: ENV["AMAZON_PW"]
        )
      
    end
end
