# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{earworm}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Aaron Patterson"]
  s.date = %q{2008-08-05}
  s.default_executable = %q{earworm}
  s.description = %q{Earworm can identify unknown music using MusicDNS and libofa.  == FEATURES/PROBLEMS:  * Identifies mp3, ogg, and wav files.  == SYNOPSIS:  Identify an unknown audio file:  ew = Earworm::Client.new('MY Music DNS Key') info = ew.identify(:file => '/home/aaron/unknown.wav') puts "#{info.artist_name} - #{info.title}"}
  s.email = ["aaronp@rubyforge.org"]
  s.executables = ["earworm"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.files = ["History.txt", "Manifest.txt", "README.txt", "Rakefile", "bin/earworm", "lib/earworm.rb", "lib/earworm/client.rb", "lib/earworm/fingerprint.rb", "lib/earworm/puid.rb", "lib/earworm/track.rb", "lib/earworm_lib.rb", "test/test_earworm.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://earworm.rubyforge.org}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{earworm}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Earworm can identify unknown music using MusicDNS and libofa.}
  s.test_files = ["test/test_earworm.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<icanhasaudio>, [">= 0.1.1"])
      s.add_development_dependency(%q<hoe>, [">= 1.7.0"])
    else
      s.add_dependency(%q<icanhasaudio>, [">= 0.1.1"])
      s.add_dependency(%q<hoe>, [">= 1.7.0"])
    end
  else
    s.add_dependency(%q<icanhasaudio>, [">= 0.1.1"])
    s.add_dependency(%q<hoe>, [">= 1.7.0"])
  end
end
