# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "omnibus-software/version"

Gem::Specification.new do |s|
  s.name        = "omnibus-software"
  s.version     = OmnibusSoftware::VERSION
  s.authors     = ["Chef Software, Inc."]
  s.email       = ["xu.xi@founder.com"]
  s.homepage    = "http://github.com/jyogi/omnibus-software"
  s.summary     = %q{Open Source software for use with Omnibus}
  s.description = %q{Open Source software build descriptions for use with Omnibus}

  s.rubyforge_project = "omnibus-software"

  s.add_development_dependency "chefstyle", "~> 0.3"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ["lib"]
end
