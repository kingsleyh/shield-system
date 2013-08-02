require 'rspec'
require File.dirname(__FILE__) + '/../presets/helpers/build_status'

describe 'BuildStatus' do

  it 'should return name and colour (passing)' do
    assert_status(:passing,'#3BB314')
  end

  it 'should return name and colour (failing)' do
    assert_status(:failing,'#CC0000')
  end

  it 'should return name and colour (pending)' do
    assert_status(:pending,'#E6B225')
  end

  it 'should return name and colour (unstable)' do
    assert_status(:unstable,'#D6C61A')
  end

  it 'should return name and colour (error)' do
    assert_status(:error,'#A8A7A5')
  end

  it 'should return name and colour (unknown)' do
    assert_status(:unknown,'#A8A7A5')
  end

  it 'should return name and colour for key' do
    BuildStatus.key.name.should == 'Build'
    BuildStatus.key.colour.should == '#575354'
  end

  it 'should return colour for value' do
    BuildStatus.value.colour.should == 'white'
  end

  it 'should return filename' do
    BuildStatus.filename.should == 'build_status'
  end

  def assert_status(status,colour)
    BuildStatus.send(status).name.should == status.to_s.capitalize
    BuildStatus.send(status).colour.should == colour
  end

end