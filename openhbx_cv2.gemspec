lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name = %q{openhbx_cv2}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Trey Evans"]

  s.email = 'lewis.r.evans@gmail.com'
  s.date = %q{2016-09-26}
  s.description = %q{CV2 parsers for the openhbx suite.}
  s.files = `git ls-files -- lib/*`.split("\n")
  s.homepage = %q{http://github.com/ideacrew/openhbx_cv2}
  s.require_paths = ["lib"]
  s.summary = %q{Provides objects representing the CV2 XML.}
  s.license = "MIT"
  s.test_files = `git ls-files -- spec/*`.split("\n")

  # GlueDB EOL phase 5c: allow happymapper 0.10.1 (Ruby >= 3) while remaining
  # compatible with 0.5.x. This commit is gemspec-only on SHA 573fa68
  # (no CV2 format change; lib/ identical to d774b23 / 573fa68).
  s.add_runtime_dependency(%q<nokogiri-happymapper>, ">= 0.5", "< 0.11")
  s.add_runtime_dependency(%q<activesupport>, ">= 3.2")
  s.add_development_dependency(%q<rspec>, "~>3.5")
end
