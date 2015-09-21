require 'esv_api/config'

require 'httparty'

module ESV
  begin
    require "dalli"
    HAS_DALLI = true
  rescue LoadError
    HAS_DALLI = false
  end

  def self.should_use_caching?
    ESV.options[:should_cache] && HAS_DALLI
  end

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

      if ESV.should_use_caching?
        @dc = Dalli::Client.new('localhost:11211')
      end
    end

    def passage_query(passage, options={})
      query = {
          'key' => self.api_key,
          'passage' => passage
      }

      query = options.merge( query )

      if ESV.should_use_caching?
        cache_key = Digest::MD5.hexdigest( "esv_api_" + query.to_s )

        cached_value = @dc.get( cache_key )

        return cached_value unless cached_value.nil?
      end

      esv_text = ESV::Client.get( self.endpoint + '/passageQuery', { :query => query } )

      @dc.set( cache_key, esv_text ) if ESV.should_use_caching?

      return esv_text
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