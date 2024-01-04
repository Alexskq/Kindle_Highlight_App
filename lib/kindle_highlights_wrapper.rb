# lib/kindle_highlights_wrapper.rb

require 'kindle_highlights'

class KindleHighlightsWrapper
  def self.initialize_client
    KindleHighlights::Client.new(
      email_address: ENV['AMAZON_LOGIN'],
      password: ENV['AMAZON_PW']
    )
  end
end
