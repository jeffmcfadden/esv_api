require 'helper'

describe ESV::Client do
  before do
    @keys = ESV::Config::VALID_OPTIONS_KEYS
    
    ESV.configure do |config|
      config.api_key = 'a_valid_api_key'
    end
  end

  context "with module configuration" do

    before do
      ESV.configure do |config|
        @keys.each do |key|
          config.send("#{key}=", key)
        end
      end
    end

    after do
      ESV.reset
    end

    it "should inherit module configuration" do
      api = ESV::Client.new
      @keys.each do |key|
        api.send(key).should == key
      end
    end
      
    context "with class configuration" do

      before do
        @configuration = {
          :api_key => 'hereisAnAPIKey',
          :endpoint => 'http://api.esv.org/',
          :user_agent => 'Custom User Agent'
        }
      end

      context "during initialization" do
        it "should override module configuration" do
          api = ESV::Client.new(@configuration)
          @keys.each do |key|
            api.send(key).should == @configuration[key]
          end
        end
      end

      context "after initilization" do
        it "should override module configuration after initialization" do
          api = ESV::Client.new
          @configuration.each do |key, value|
            api.send("#{key}=", value)
          end
          @keys.each do |key|
            api.send(key).should == @configuration[key]
          end
        end
      end

    end
  end
  
  describe ".passage_query" do
    it "should return a string" do
      api = ESV::Client.new
      api.passage_query( 'John 1:1' ).should be_a String
    end
    
    it "should not return an error with a valid passage" do
      api = ESV::Client.new
      api.passage_query( 'John 1:1' ).should_not include("ERROR")
    end
    
    it "should return an error with an invalid passage" do
      api = ESV::Client.new
      api.passage_query( 'Fail Whale' ).should include("ERROR")
    end
  end
  
  describe ".query" do
    it "should return a string" do
      api = ESV::Client.new
      api.query( 'John 1:1' ).should be_a String
    end
    
    it "should not return an error with a valid passage" do
      api = ESV::Client.new
      api.query( 'John 1:1' ).should_not include("ERROR")
    end
  end
  
  describe ".reading_plan_query" do
    it "should return a string" do
      api = ESV::Client.new
      api.reading_plan_query().should be_a String
    end
    
    it "should not return an error with a valid passage" do
      api = ESV::Client.new
      api.reading_plan_query().should_not include("ERROR")
    end
  end
  
  describe ".query_info" do
    it "should return a string" do
      api = ESV::Client.new
      api.query_info( 'John 1:1' ).should be_a String
    end
    
    it "should not return an error with a valid passage" do
      api = ESV::Client.new
      api.query_info( 'John 1:1' ).should_not include("ERROR")
    end
    
  end
  
  describe ".reading_plan_info" do
    it "should return a string" do
      api = ESV::Client.new
      api.reading_plan_info().should be_a String
    end
    
    it "should not return an error with a valid passage" do
      api = ESV::Client.new
      api.reading_plan_info().should_not include("ERROR")
    end
  end
  
  describe ".verse" do
    it "should return a string" do
      api = ESV::Client.new
      api.verse().should be_a String
    end
    
    it "should not return an error with a valid passage" do
      api = ESV::Client.new
      api.verse().should_not include("ERROR")
    end
  end
  
  describe ".daily_verse" do
    it "should return a string" do
      api = ESV::Client.new
      api.daily_verse().should be_a String
    end
    
    it "should not return an error with a valid passage" do
      api = ESV::Client.new
      api.daily_verse().should_not include("ERROR")
    end
  end
  
  
  
  
  
  
  
end
