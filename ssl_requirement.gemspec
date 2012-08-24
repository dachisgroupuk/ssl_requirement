Gem::Specification.new do |s|
  s.name = 'ssl_requirement'
  s.version = '1.0.6.1'
  s.date = '2012-08-24'

  s.summary = "Allow controller actions to force SSL on specific parts of the site."
  s.description = "SSL requirement adds a declarative way of specifying that certain actions should only be allowed to run under SSL, and if they're accessed without it, they should be redirected."

  s.authors = ['RailsJedi', 'David Heinemeier Hansson', 'jcnetdev', 'bcurren', 'bmpercy']
  s.email = 'percival@umamibud.com'
  s.homepage = 'https://github.com/headshift/ssl_requirement'

  s.has_rdoc = true
  s.rdoc_options = ["--main", "README"]
  s.extra_rdoc_files = ["README"]

  s.add_dependency 'rails', ['>= 2.3.2']

  s.files = ["README",
             "init.rb",
             "lib/ssl_requirement.rb",
             "lib/url_rewriter.rb",
             "rails/init.rb",
             "ssl_requirement.gemspec"]

  s.test_files = ["test/ssl_requirement_test.rb",
                  "test/url_rewriter_test.rb"]
end
