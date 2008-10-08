Gem::Specification.new do |s|
  s.name = %q{merb_has_flash}
  s.version = "0.9.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Michael D. Ivey", "Jeremy Nicoll"]
  s.date = %q{2008-09-10}
  s.description = %q{Rails' 'flash' session notification system ported to Merb}
  s.email = %q{ivey@gweezlebur.com}
  s.files = ["LICENSE", "Rakefile", "README", "TODO", "lib/merb_has_flash.rb", "lib/merb_has_flash/controller_extension.rb", "lib/merb_has_flash/flash_hash.rb", "lib/merb_has_flash/helper.rb", "spec/merb_has_flash/controller_extension_spec.rb", "spec/merb_has_flash/flash_hash_spec.rb", "spec/spec_helper.rb"]
  s.homepage = %q{http://github.com/ivey/merb_has_flash}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{Rails' 'flash' session notification system ported to Merb}
  s.test_files = ["spec/merb_has_flash/controller_extension_spec.rb", "spec/merb_has_flash/flash_hash_spec.rb", "spec/spec_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
      s.add_runtime_dependency(%q<merb-core>, ["> 0.9.0"])
    else
      s.add_dependency(%q<merb-core>, ["> 0.9.0"])
    end
  else
    s.add_dependency(%q<merb-core>, ["> 0.9.0"])
  end
end
