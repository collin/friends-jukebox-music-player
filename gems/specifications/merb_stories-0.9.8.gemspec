Gem::Specification.new do |s|
  s.name = %q{merb_stories}
  s.version = "0.9.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Yehuda Katz"]
  s.date = %q{2008-10-07}
  s.description = %q{Merb plugin that provides RSpec stories support}
  s.email = %q{ykatz@engineyard.com}
  s.extra_rdoc_files = ["README", "LICENSE", "TODO"]
  s.files = ["LICENSE", "README", "Rakefile", "Generators", "TODO", "lib/generators", "lib/generators/merb_story_setup.rb", "lib/generators/story.rb", "lib/generators/templates", "lib/generators/templates/merb_story_setup", "lib/generators/templates/merb_story_setup/stories", "lib/generators/templates/merb_story_setup/stories/helper.rb", "lib/generators/templates/merb_story_setup/stories/stories", "lib/generators/templates/merb_story_setup/stories/stories/all.rb", "lib/generators/templates/story", "lib/generators/templates/story/step.rbt", "lib/generators/templates/story/story.rbt", "lib/generators/templates/story/story.t", "lib/merb_stories.rb", "lib/merb_stories", "lib/merb_stories/merbtasks.rb", "lib/merb_stories/story.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://merbivore.com}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{merb}
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{Merb plugin that provides RSpec stories support}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
      s.add_runtime_dependency(%q<rspec>, [">= 1.1.3"])
    else
      s.add_dependency(%q<rspec>, [">= 1.1.3"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.1.3"])
  end
end
