Gem::Specification.new do |s|
  s.add_dependency 'httparty'
  s.add_development_dependency 'rspec'
  
  s.platform    = Gem::Platform::RUBY
  s.name        = 'esv_api'
  s.version     = '1.0.0'
  s.authors     = ["Jeff McFadden"]
  s.email       = ["jeff@forgeapps.com"]
  s.homepage    = "http://github.com/jeffmcfadden/esv_api"
  s.summary     = "ESV API Wrapper."
  s.description = "ESV API Wrapper."
  
  s.required_ruby_version = '>= 1.9.2'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'
end