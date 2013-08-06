require 'rspec'
require File.dirname(__FILE__) + '/../presets/github_build_status'
require File.dirname(__FILE__) + '/spec_helper'

describe 'GithubBuildStatus' do

  before :each do
    @output_path = File.dirname(__FILE__) + '/images'
    @build_status = GithubBuildStatus.new(@output_path,TRANSPARENT_BACKGROUND,FONT_EAGLE)
  end

  it 'should generate a github style status badge (passing)' do
    generate(BuildStatus.passing)
    assert_file_exists?('passing')
  end

  it 'should generate a github style status badge (failing)' do
    generate(BuildStatus.failing)
    assert_file_exists?('failing')
  end

  it 'should generate a github style status badge (pending)' do
    generate(BuildStatus.pending)
    assert_file_exists?('pending')
  end

  it 'should generate a github style status badge (unstable)' do
    generate(BuildStatus.unstable)
    assert_file_exists?('unstable')
  end

  it 'should generate a github style status badge (error)' do
    generate(BuildStatus.error)
    assert_file_exists?('error')
  end

  it 'should generate a github style status badge (unknown)' do
    generate(BuildStatus.unknown)
    assert_file_exists?('unknown')
  end


  def generate(status)
    @build_status.shield(status, true)
  end


end