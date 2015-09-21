require 'esv_api/version'

module ESV
  # Defines constants and methods related to configuration
  module Config

    # The API Key if none is set
    DEFAULT_API_KEY = nil

    # The endpoint that will be used to connect if none is set
    DEFAULT_ENDPOINT = 'http://www.esvapi.org/v2/rest/'

    # The value sent in the 'User-Agent' header if none is set
    DEFAULT_USER_AGENT = "esv_api Ruby Gem #{ESV::Version}"

    # An array of valid keys in the options hash when configuring a {Twitter::Client}
    VALID_OPTIONS_KEYS = [
      :api_key,
      :endpoint,
      :user_agent,
      :should_cache
    ]

    attr_accessor *VALID_OPTIONS_KEYS

    # When this module is extended, set all configuration options to their default values
    def self.extended(base)
      base.reset
    end

    # Convenience method to allow configuration options to be set in a block
    def configure
      yield self
      self
    end

    # Create a hash of options and their values
    def options
      options = {}
      VALID_OPTIONS_KEYS.each{|k| options[k] = send(k)}
      options
    end

    # Reset all configuration options to defaults
    def reset
      self.api_key            = DEFAULT_API_KEY
      self.endpoint           = DEFAULT_ENDPOINT
      self.user_agent         = DEFAULT_USER_AGENT
      self.should_cache       = true
      self
    end

  end
end
