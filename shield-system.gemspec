Gem::Specification.new do |s|
  s.name = 'shield-system'
  s.version = '0.0.2'
  s.authors = ['Kingsley Hendrickse']
  s.date = '2013-08-02'
  s.description = 'Create status badge images for use on github pages etc'
  s.email = 'kingsley@masterthought.net'
  s.extra_rdoc_files = [
      'README.md'
  ]
  s.files = [
      'src/shield_system.rb', 'src/systems/github_shield.rb', 'src/systems/sparkline_shield.rb', 'src/presets/helpers/build_status.rb', 'src/presets/github_build_status.rb'
  ]
  s.require_paths = ['src']
  s.homepage = 'https://github.com/masterthought/shield-system'
  s.licenses = ['Apache 2.0']
  s.rubygems_version = '1.9.3'
  s.summary = 'Create status badge images for use on github pages etc'

  s.add_development_dependency 'rspec'
  s.add_dependency 'rmagick'
  s.add_dependency 'sparklines'

end

