Gem::Specification.new do |s|
  s.name = %q{merb_laszlo}
  s.version = "0.9.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Yehuda Katz"]
  s.date = %q{2008-10-07}
  s.description = %q{Merb plugin that provides support for Laszlo.}
  s.email = %q{ykatz@engineyard.com}
  s.extra_rdoc_files = ["README", "LICENSE"]
  s.files = ["LICENSE", "README", "Rakefile", "lib/merb-laszlo.rb", "lib/merb-laszlo", "lib/merb-laszlo/controllers.rb", "lib/merb-laszlo/helpers.rb", "lib/merb-laszlo/merbtasks.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://merbivore.com}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{merb}
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{Merb plugin that provides support for Laszlo.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
      s.add_runtime_dependency(%q<merb-core>, [">= 0.9.8"])
    else
      s.add_dependency(%q<merb-core>, [">= 0.9.8"])
    end
  else
    s.add_dependency(%q<merb-core>, [">= 0.9.8"])
  end
end
