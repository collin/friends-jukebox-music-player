Gem::Specification.new do |s|
  s.name = %q{merb_screw_unit}
  s.version = "0.9.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Yehuda Katz"]
  s.date = %q{2008-10-07}
  s.description = %q{Merb Slice that provides support for Screw.Unit testing}
  s.email = %q{ykatz@engineyard.com}
  s.extra_rdoc_files = ["README", "LICENSE"]
  s.files = ["LICENSE", "README", "Rakefile", "TODO", "lib/merb_screw_unit.rb", "lib/merb_screw_unit", "lib/merb_screw_unit/merbtasks.rb", "lib/merb_screw_unit/slicetasks.rb", "spec/controllers", "spec/controllers/main_spec.rb", "spec/merb_screw_unit_spec.rb", "spec/spec_helper.rb", "app/controllers", "app/controllers/application.rb", "app/controllers/main.rb", "app/helpers", "app/helpers/application_helper.rb", "app/views", "app/views/layout", "app/views/layout/merb_screw_unit.html.erb", "app/views/main", "app/views/main/index.html.erb", "public/javascripts", "public/javascripts/jquery-1.2.6.js", "public/javascripts/jquery.fn.js", "public/javascripts/jquery.print.js", "public/javascripts/master.js", "public/javascripts/screw.behaviors.js", "public/javascripts/screw.builder.js", "public/javascripts/screw.events.js", "public/javascripts/screw.matchers.js", "public/javascripts/screw.mock.js", "public/stylesheets", "public/stylesheets/master.css", "public/stylesheets/screw.css", "stubs/app", "stubs/app/controllers", "stubs/app/controllers/application.rb", "stubs/app/controllers/main.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://merbivore.com}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{merb}
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{Merb Slice that provides support for Screw.Unit testing}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
      s.add_runtime_dependency(%q<merb-core>, [">= 0.9.8"])
      s.add_runtime_dependency(%q<merb-slices>, [">= 0.9.8"])
    else
      s.add_dependency(%q<merb-core>, [">= 0.9.8"])
      s.add_dependency(%q<merb-slices>, [">= 0.9.8"])
    end
  else
    s.add_dependency(%q<merb-core>, [">= 0.9.8"])
    s.add_dependency(%q<merb-slices>, [">= 0.9.8"])
  end
end
