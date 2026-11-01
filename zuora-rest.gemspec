$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)

require 'zuora/version'

Gem::Specification.new do |s|
  s.name             = "zuora-rest"
  s.version          = Zuora::VERSION
  s.summary          = "Lite Zuora REST API client"
  s.description      = "Basic REST API client to make simple subscription system on Zuora work"
  s.authors          = ["Gherry Harahap"]
  s.email            = ["gherry@tradegecko.com"]
  s.homepage         = "http://rubygems.org/gems/zuora-rest"
  s.license          = "MIT"
  s.extra_rdoc_files = ["LICENSE", "README.md"]

  s.required_ruby_version = ">= 3.2"

  s.add_dependency 'httparty'
  # lib/zuora-rest.rb requires active_support/inflector, core_ext/hash/keys and
  # core_ext/date/calculations. Previously undeclared; it only worked because the
  # consuming Rails app had already loaded ActiveSupport.
  s.add_dependency 'activesupport', '>= 7.2', '< 8.2'
  # OpenStruct (error_handler/base.rb) leaves the default gems in Ruby 3.5.
  s.add_dependency 'ostruct', '>= 0.6'

  s.add_development_dependency 'pry', '~> 0.15'
  s.add_development_dependency 'rake', '~> 13.0'
  s.add_development_dependency 'rspec', '~> 3.13'
  s.add_development_dependency 'rspec_junit_formatter', '~> 0.6'
  s.add_development_dependency 'webmock', '~> 3.25'

  s.files            = `git ls-files`.split("\n")
  s.require_paths    = ["lib"]
end
