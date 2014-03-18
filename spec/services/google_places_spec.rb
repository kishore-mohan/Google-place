require 'spec_helper'

describe GooglePlaces do
  context "Google" do
    let(:gp){ GooglePlaces.new('text') }
    let(:junk){ GooglePlaces.new('12346u13283289') }

    it "should give developer key" do
      gp.developer_key.should == "AIzaSyBxZnX98cx7SMD8qqkD3IVtgm9Ipu-dP64"
    end

    it "should give search name" do
      gp.search_name.should == "text"
    end

    it "search name shouldn't be blank" do
      gp.search_name.should_not be_blank
    end

    context "search places" do
      it "should give me status ok" do
        gp.search_place.status.should == "OK"
      end

      it "should give me status zero result" do
        junk.search_place.status.should == "ZERO_RESULTS"
      end

      it "should have some results" do
        gp.search_place.results.should_not be_empty
      end

      it "shoud give empty result" do
        junk.search_place.results.should be_empty
      end
    end

  end
end