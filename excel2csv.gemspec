# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "excel2csv/version"

Gem::Specification.new do |spec|
  spec.name          = "excel2csv"
  spec.version       = Excel2csv::VERSION
  spec.authors       = ["eggchicken"]
  spec.email         = ["no.eggchicken@gmail.com"]

  spec.summary       = "convert excel to csv"
  spec.description   = "convert excel to csv"
  spec.homepage      = "https://github.com/egg-chicken/excel2csv"
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry", "~> 0.10"

  spec.add_runtime_dependency "nokogiri", "~> 1.8"
  spec.add_runtime_dependency "roo", "~> 2.7"
  spec.add_runtime_dependency "axlsx", "~> 1.3"
  spec.add_runtime_dependency "zip-zip", "~> 0.3" # https://github.com/randym/axlsx/issues/234
end
