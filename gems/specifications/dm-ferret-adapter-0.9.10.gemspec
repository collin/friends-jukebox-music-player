# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{dm-ferret-adapter}
  s.version = "0.9.10"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Bernerd Schaefer"]
  s.date = %q{2009-01-19}
  s.default_executable = %q{ferret}
  s.description = %q{Ferret Adapter for DataMapper}
  s.email = ["bernerd [a] wieck [d] com"]
  s.executables = ["ferret"]
  s.extra_rdoc_files = ["README.txt", "LICENSE", "TODO", "History.txt"]
  s.files = [".gitignore", "History.txt", "LICENSE", "Manifest.txt", "README.txt", "Rakefile", "TODO", "bin/ferret", "lib/ferret_adapter.rb", "lib/ferret_adapter/local_index.rb", "lib/ferret_adapter/remote_index.rb", "lib/ferret_adapter/repository_ext.rb", "lib/ferret_adapter/version.rb", "spec/adapter_spec.rb", "spec/helper.rb", "spec/spec.opts", "tasks/install.rb", "tasks/spec.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/sam/dm-more/tree/master/adapters/dm-ferret-adapter}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{datamapper}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Ferret Adapter for DataMapper}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<dm-core>, ["~> 0.9.10"])
      s.add_runtime_dependency(%q<ferret>, ["~> 0.11.6"])
    else
      s.add_dependency(%q<dm-core>, ["~> 0.9.10"])
      s.add_dependency(%q<ferret>, ["~> 0.11.6"])
    end
  else
    s.add_dependency(%q<dm-core>, ["~> 0.9.10"])
    s.add_dependency(%q<ferret>, ["~> 0.11.6"])
  end
end
