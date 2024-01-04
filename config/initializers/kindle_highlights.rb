# config/initializers/kindle_highlights.rb


require_relative '../../lib/kindle_highlights_wrapper'

KINDLE = KindleHighlightsWrapper.initialize_client unless Rails.env.production?
