require 'spec_helper'

describe Trap do
  describe 'latitude' do
  	it 'should have float value for long' do
  	trap1 = FactoryGirl.build(:trap, lat: nil)
  	trap1.should_not be_valid
  end 
 end
  describe 'longitude' do
  	it 'should have float value for long' do
  	trap1 = FactoryGirl.build(:trap, long: nil)
  	trap1.should_not be_valid
  end 
 end
end
