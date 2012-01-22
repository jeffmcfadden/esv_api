require 'esv_api/config'

require 'httparty'

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
          'key' => self.api_key,
          'passage' => passage
      }
      
      query = options.merge( query )
      
      ESV::Client.get( self.endpoint + '/passageQuery', { :query => query } )
    end
    
    def query( q, options={} )
      query = {
          'key' => self.api_key,
          'q' => q
      }
      
      query = options.merge( query )
      
      ESV::Client.get( self.endpoint + '/query', { :query => query } )
    end
    
    def reading_plan_query( options={} )
      query = {
          'key' => self.api_key,
      }
      
      query = options.merge( query )
      
      ESV::Client.get( self.endpoint + '/readingPlanQuery', { :query => query } )
    end
    
    def query_info( q, options={} )
      query = {
          'key' => self.api_key,
          'q'   => q
      }
      
      query = options.merge( query )
      
      ESV::Client.get( self.endpoint + '/queryInfo', { :query => query } )
    end
    
    def reading_plan_info( options={} )
      query = {
          'key' => self.api_key,
      }
      
      query = options.merge( query )
      
      ESV::Client.get( self.endpoint + '/readingPlanQuery', { :query => query } )
    end
    
    def verse( options={} )
      query = {
          'key' => self.api_key,
      }
      
      query = options.merge( query )
      
      ESV::Client.get( self.endpoint + '/verse', { :query => query } )
    end
    
    def daily_verse( options={} )
      query = {
          'key' => self.api_key,
      }
      
      query = options.merge( query )
      
      ESV::Client.get( self.endpoint + '/verse', { :query => query } )
    end
    
  end
end