require 'rspec'
require File.dirname(__FILE__) + '/../shield_system'
require File.dirname(__FILE__) + '/../presets/helpers/build_status'
require File.dirname(__FILE__) + '/spec_helper'

describe 'ShieldSystem' do

  before :each do
    @output_path = File.dirname(__FILE__) + '/images'
    @shield = ShieldSystem.new(@output_path)
  end

  it 'should generate a github style status badge' do
    name = 'acceptance'
    @shield.github_shield(name, 'Acceptance Tests', BuildStatus.passing.name, '#25B9E6', BuildStatus.passing.colour, '#0C0861', 'white',TRANSPARENT_BACKGROUND, FONT_EAGLE)
    assert_file_exists?(name)
  end

  it 'should generate a github style status badge with custom height' do
    name = 'height'
    @shield.github_shield(name, 'Dependencies', 'up-to-date', BuildStatus.key.colour, BuildStatus.passing.colour, BuildStatus.value.colour, 'white', TRANSPARENT_BACKGROUND, FONT_EAGLE, 30, 15, 'arial')
    assert_file_exists?(name)
  end

  it 'should generate a github style status badge with custom font' do
    name = 'font'
    @shield.github_shield(name, 'GPA', '4.0', '#25B9E6', BuildStatus.passing.colour, '#0C0861', 'white', TRANSPARENT_BACKGROUND, FONT_EAGLE, 20, 13, 'times')
    assert_file_exists?(name)
  end

  it 'should generate a sparkline bar' do
    name = 'build-history-bar'
    @shield.sparkline_shield(name, :bar, [100, 100, 90, 80, 90, 90, 100, 120, 120, 90, 80, 70, 100, 120])
    assert_file_exists?(name)
  end

  it 'should generate a sparkline pie' do
    name = 'build-history-pie'
    @shield.sparkline_shield(name, :pie, [70])
    assert_file_exists?(name)
  end

end