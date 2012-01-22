require 'esv_api/config'

module ESV
  # Wrapper for the ESV API
  #
  class Client
    include HTTParty
    format :html
    
    attr_accessor *Config::VALID_OPTIONS_KEYS

    # Initializes a new API object
    #
    # @param attrs [Hash]
    # @return [ESV::Client]
    def initialize(attrs={})
      attrs = ESV.options.merge(attrs)
      Config::VALID_OPTIONS_KEYS.each do |key|
        instance_variable_set("@#{key}".to_sym, attrs[key])
      end
    end
    
    def passage_query(passage, options={})
      query = {
          'key' => ESV::Config.api_key,
          'passage' => passage
      }
      
      query = (options += query ).uniq
      
      ESV::Client.get( ESV::Config.endpoint + '/passageQuery', { :query => queryOptions } )
    end
  end
end