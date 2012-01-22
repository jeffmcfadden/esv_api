require 'helper'

describe ESV do
  after do
    ESV.reset
  end
  
  describe ".new" do
    it "should return an ESV::Client" do
      ESV.new.should be_a ESV::Client
    end
  end
end