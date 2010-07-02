# encoding: utf-8

require File.expand_path('../../spec_helper', __FILE__)

describe CarrierWave::Uploader do

  before do
    @uploader_class = Class.new(CarrierWave::Uploader::Base)
    @uploader = @uploader_class.new
  end
  
  after do
    FileUtils.rm_rf(public_path)
  end

  describe '#root' do
    it "should default to the config option" do
      @uploader.root.should == public_path
    end
  end

end