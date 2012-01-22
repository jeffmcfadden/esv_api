require 'esv_api/client'
require 'esv_api/config'

module ESV
  extend Config
  class << self
    # Alias for ESV::Client.new
    #
    # @return [ESV::Client]
    def new(options={})
      ESV::Client.new(options)
    end

    # Delegate to ESV::Client
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private=false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end
end
