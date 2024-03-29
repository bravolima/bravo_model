$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bravo_model/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bravo_model"
  s.version     = BravoModel::VERSION
  s.authors     = ["Your name"]
  s.email       = ["bravolimauk@gmail.com"]
  s.summary     = "ActiveModel compatible tableless model"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  #s.add_dependency "rails", "~> 3.1.3"
  #s.add_development_dependency "sqlite3"
end
