# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{dm-tags}
  s.version = "0.9.10"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Bobby Calderwood"]
  s.date = %q{2009-01-19}
  s.description = %q{This package brings tagging to DataMapper.  It is inspired by Acts As Taggable On by Michael Bleigh, github's mbleigh.  Props to him for the contextual tagging based on Acts As Taggable on Steroids.}
  s.email = ["bobby_calderwood [a] me [d] com"]
  s.extra_rdoc_files = ["README.txt", "LICENSE", "TODO", "History.txt"]
  s.files = [".gitignore", "History.txt", "LICENSE", "Manifest.txt", "README.txt", "Rakefile", "TODO", "lib/dm-tags.rb", "lib/dm-tags/dm_tags.rb", "lib/dm-tags/tag.rb", "lib/dm-tags/tagging.rb", "lib/dm-tags/version.rb", "spec/dm-tags/dm_tags_spec.rb", "spec/dm-tags/tag_spec.rb", "spec/dm-tags/taggable_spec.rb", "spec/dm-tags/tagging_spec.rb", "spec/dm-tags/updating_spec.rb", "spec/spec.opts", "spec/spec_helper.rb", "tasks/install.rb", "tasks/spec.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/sam/dm-more/tree/master/dm-tags}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{datamapper}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{This package brings tagging to DataMapper.  It is inspired by Acts As Taggable On by Michael Bleigh, github's mbleigh.  Props to him for the contextual tagging based on Acts As Taggable on Steroids.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<dm-core>, ["~> 0.9.10"])
      s.add_runtime_dependency(%q<dm-validations>, ["~> 0.9.10"])
    else
      s.add_dependency(%q<dm-core>, ["~> 0.9.10"])
      s.add_dependency(%q<dm-validations>, ["~> 0.9.10"])
    end
  else
    s.add_dependency(%q<dm-core>, ["~> 0.9.10"])
    s.add_dependency(%q<dm-validations>, ["~> 0.9.10"])
  end
end
