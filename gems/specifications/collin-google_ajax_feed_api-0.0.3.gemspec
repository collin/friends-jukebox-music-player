# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{collin-google_ajax_feed_api}
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Collin Miller"]
  s.date = %q{2008-12-22}
  s.email = %q{collintmiller@gmail.com}
  s.files = ["README", "Rakefile.rb", "lib/google_ajax_feed_api", "lib/google_ajax_feed_api/api.rb", "lib/google_ajax_feed_api/api", "lib/google_ajax_feed_api/api/one_zero.rb", "lib/google_ajax_feed_api/feed.rb", "lib/google_ajax_feed_api/entry.rb", "lib/google_ajax_feed_api.rb", "spec/helper.rb", "spec/entry_spec.rb", "spec/feed_spec.rb", "spec/api_spec.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/collin/fold}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Light wrapper for Google Ajax Feed API}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rake>, [">= 0"])
      s.add_runtime_dependency(%q<rspec>, [">= 0"])
      s.add_runtime_dependency(%q<json>, [">= 0"])
      s.add_runtime_dependency(%q<extlib>, [">= 0"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<json>, [">= 0"])
      s.add_dependency(%q<extlib>, [">= 0"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<json>, [">= 0"])
    s.add_dependency(%q<extlib>, [">= 0"])
  end
end
