require_relative 'lib/GPG/version'

Gem::Specification.new do |spec|
  spec.name          = "GPG"
  spec.version       = GPG::VERSION
  spec.authors       = ["Michael-Meade"]
  spec.email         = ["mameade@utica.edu"]

  spec.summary       = %q{GPG wrapper}
  spec.description   = %q{GPG wrapper}
  spec.homepage      = "https://google.com"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir['**/**'].grep_v(/.gem$/)
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
