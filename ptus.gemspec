Gem::Specification.new do |s|
  s.name        = "ptus"
  s.version     = "1.0.2"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Nat Ritmeyer"]
  s.email       = ["nat@natontesting.com"]
  s.homepage    = "http://github.com/natritmeyer/ptus"
  s.summary     = "If you write 'ptus', it will work like 'puts'; but the offending line will be flagged"
  s.description = "Your 'ptus' typo sins will be forgiven, but not forgotten"
  s.files        = Dir.glob("lib/**/*") + %w(LICENSE README.rdoc)
  s.require_path = 'lib'
end