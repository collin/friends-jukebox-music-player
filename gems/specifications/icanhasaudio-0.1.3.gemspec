# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{icanhasaudio}
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Aaron Patterson"]
  s.date = %q{2008-10-02}
  s.description = %q{Hai! icanhasaudio? is an interface to lame for decoding ur MP3s.  I iz in ur computer. Decodin ur mp3s.  Whatevs!  I also decodin ur OGGz!  I kin also encodin' ur WAV and AIFF to mp3z!  == SYNOPSYS ROFLOL  require 'icanhasaudio'  reader = Audio::MPEG::Decoder.new File.open(ARGV[0], 'rb') { |input_lol| File.open(ARGV[1], 'wb') { |output_lol| reader.decode(input_lol, output_lol) } }}
  s.email = %q{aaronp@rubyforge.org}
  s.extensions = ["ext/icanhasaudio/extconf.rb"]
  s.extra_rdoc_files = ["History.txt", "LICENSE.txt", "Manifest.txt", "README.txt"]
  s.files = ["History.txt", "LICENSE.txt", "Manifest.txt", "README.txt", "Rakefile", "examples/decoder.rb", "examples/encoder.rb", "examples/kexp.rb", "ext/icanhasaudio/audio_mpeg_decoder.c", "ext/icanhasaudio/audio_mpeg_decoder.h", "ext/icanhasaudio/audio_mpeg_decoder_mp3data.c", "ext/icanhasaudio/audio_mpeg_decoder_mp3data.h", "ext/icanhasaudio/audio_mpeg_encoder.c", "ext/icanhasaudio/audio_mpeg_encoder.h", "ext/icanhasaudio/audio_ogg_decoder.c", "ext/icanhasaudio/audio_ogg_decoder.h", "ext/icanhasaudio/extconf.rb", "ext/icanhasaudio/get_audio.c", "ext/icanhasaudio/get_audio.h", "ext/icanhasaudio/native.c", "ext/icanhasaudio/native.h", "ext/icanhasaudio/rb_wav.c", "ext/icanhasaudio/rb_wav.h", "lib/icanhasaudio.rb", "lib/icanhasaudio/mpeg.rb", "lib/icanhasaudio/mpeg/decoder.rb", "lib/icanhasaudio/mpeg/encoder.rb", "lib/icanhasaudio/ogg.rb", "lib/icanhasaudio/ogg/decoder.rb", "lib/icanhasaudio/version.rb", "lib/icanhasaudio/wav.rb", "lib/icanhasaudio/wav/file.rb", "test/assets/icha.mp3", "test/assets/testcase.wav", "test/helper.rb", "test/mpeg/test_decoder.rb", "test/test_mpeg_encoder.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://icanhasaudio.com/
}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib", "ext"]
  s.rubyforge_project = %q{seattlerb}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{icanhasaudio is a lame/vorbis wrapper for decoding ur mp3s and ur oggs.}
  s.test_files = ["test/mpeg/test_decoder.rb", "test/test_mpeg_encoder.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<hoe>, [">= 1.7.0"])
    else
      s.add_dependency(%q<hoe>, [">= 1.7.0"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 1.7.0"])
  end
end
