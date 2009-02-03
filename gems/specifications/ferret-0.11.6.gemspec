# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ferret}
  s.version = "0.11.6"

  s.required_rubygems_version = nil if s.respond_to? :required_rubygems_version=
  s.authors = ["David Balmain"]
  s.autorequire = %q{ferret}
  s.cert_chain = nil
  s.date = %q{2007-11-28}
  s.default_executable = %q{ferret-browser}
  s.description = %q{Ferret is a port of the Java Lucene project. It is a powerful indexing and search library.}
  s.email = %q{dbalmain@gmail.com}
  s.executables = ["ferret-browser"]
  s.extensions = ["ext/extconf.rb"]
  s.extra_rdoc_files = ["README", "TODO", "TUTORIAL", "MIT-LICENSE", "ext/r_index.c", "ext/r_analysis.c", "ext/r_utils.c", "ext/r_search.c", "ext/r_qparser.c", "ext/r_store.c", "ext/ferret.c"]
  s.files = ["setup.rb", "TODO", "TUTORIAL", "Rakefile", "CHANGELOG", "README", "MIT-LICENSE", "ext/lang.h", "ext/q_filtered_query.c", "ext/stem_ISO_8859_1_spanish.h", "ext/stem_ISO_8859_1_spanish.c", "ext/global.c", "ext/stem_UTF_8_italian.c", "ext/modules.h", "ext/stem_UTF_8_portuguese.c", "ext/stem_ISO_8859_1_dutch.c", "ext/store.h", "ext/stem_UTF_8_spanish.h", "ext/array.c", "ext/stem_ISO_8859_1_finnish.c", "ext/stem_ISO_8859_1_finnish.h", "ext/stem_UTF_8_finnish.h", "ext/stem_ISO_8859_1_italian.h", "ext/analysis.h", "ext/q_wildcard.c", "ext/except.h", "ext/stem_UTF_8_english.c", "ext/stem_ISO_8859_1_german.h", "ext/api.c", "ext/r_index.c", "ext/hashset.c", "ext/stem_ISO_8859_1_german.c", "ext/stem_ISO_8859_1_swedish.h", "ext/utilities.c", "ext/stem_UTF_8_spanish.c", "ext/stem_UTF_8_dutch.h", "ext/stem_ISO_8859_1_danish.c", "ext/q_match_all.c", "ext/stem_UTF_8_german.c", "ext/compound_io.c", "ext/hash.h", "ext/q_prefix.c", "ext/stopwords.c", "ext/stem_ISO_8859_1_italian.c", "ext/bitvector.h", "ext/stem_ISO_8859_1_dutch.h", "ext/bitvector.c", "ext/r_analysis.c", "ext/mempool.h", "ext/config.h", "ext/stem_UTF_8_german.h", "ext/stem_UTF_8_porter.c", "ext/stem_ISO_8859_1_norwegian.c", "ext/threading.h", "ext/stem_UTF_8_norwegian.c", "ext/stem_ISO_8859_1_swedish.c", "ext/stem_UTF_8_portuguese.h", "ext/search.h", "ext/hash.c", "ext/stem_UTF_8_swedish.c", "ext/fs_store.c", "ext/stem_UTF_8_french.h", "ext/stem_UTF_8_finnish.c", "ext/stem_UTF_8_danish.c", "ext/stem_UTF_8_porter.h", "ext/ferret.c", "ext/term_vectors.c", "ext/posh.c", "ext/stem_ISO_8859_1_norwegian.h", "ext/helper.c", "ext/mempool.c", "ext/r_utils.c", "ext/document.c", "ext/stem_KOI8_R_russian.c", "ext/stem_KOI8_R_russian.h", "ext/r_search.c", "ext/libstemmer.c", "ext/api.h", "ext/stem_ISO_8859_1_portuguese.c", "ext/r_qparser.c", "ext/multimapper.h", "ext/stem_ISO_8859_1_french.c", "ext/stem_UTF_8_danish.h", "ext/stem_ISO_8859_1_portuguese.h", "ext/hashset.h", "ext/q_parser.c", "ext/analysis.c", "ext/r_store.c", "ext/stem_UTF_8_swedish.h", "ext/stem_UTF_8_italian.h", "ext/q_phrase.c", "ext/q_term.c", "ext/priorityqueue.h", "ext/libstemmer.h", "ext/filter.c", "ext/q_span.c", "ext/multimapper.c", "ext/index.h", "ext/helper.h", "ext/similarity.h", "ext/stem_UTF_8_french.c", "ext/header.h", "ext/index.c", "ext/posh.h", "ext/document.h", "ext/similarity.c", "ext/stem_UTF_8_russian.c", "ext/win32.h", "ext/q_fuzzy.c", "ext/search.c", "ext/stem_ISO_8859_1_porter.c", "ext/stem_UTF_8_russian.h", "ext/ram_store.c", "ext/stem_ISO_8859_1_porter.h", "ext/except.c", "ext/q_range.c", "ext/sort.c", "ext/q_multi_term.c", "ext/q_const_score.c", "ext/q_boolean.c", "ext/stem_UTF_8_norwegian.h", "ext/priorityqueue.c", "ext/array.h", "ext/stem_ISO_8859_1_danish.h", "ext/store.c", "ext/stem_UTF_8_english.h", "ext/stem_ISO_8859_1_english.h", "ext/stem_ISO_8859_1_french.h", "ext/stem_ISO_8859_1_english.c", "ext/ferret.h", "ext/global.h", "ext/stem_UTF_8_dutch.c", "ext/inc/lang.h", "ext/inc/threading.h", "lib/ferret_version.rb", "lib/ferret/field_infos.rb", "lib/ferret/browser/webrick.rb", "lib/ferret/browser.rb", "lib/ferret/document.rb", "lib/ferret/index.rb", "lib/ferret/number_tools.rb", "lib/ferret.rb", "lib/ferret/browser/views/home/index.rhtml", "lib/ferret/browser/views/help/index.rhtml", "lib/ferret/browser/views/document/list.rhtml", "lib/ferret/browser/views/document/show.rhtml", "lib/ferret/browser/views/term/index.rhtml", "lib/ferret/browser/views/term/termdocs.rhtml", "lib/ferret/browser/views/error/index.rhtml", "lib/ferret/browser/views/layout.rhtml", "lib/ferret/browser/views/term-vector/index.rhtml", "lib/ferret/browser/s/style.css", "lib/ferret/browser/s/global.js", "test/unit/index/th_doc.rb", "test/unit/index/tc_index_writer.rb", "test/unit/index/tc_index.rb", "test/unit/index/tc_index_reader.rb", "test/unit/ts_index.rb", "test/unit/tc_document.rb", "test/unit/ts_query_parser.rb", "test/unit/utils/tc_bit_vector.rb", "test/unit/utils/tc_priority_queue.rb", "test/unit/utils/tc_number_tools.rb", "test/unit/ts_analysis.rb", "test/unit/query_parser/tc_query_parser.rb", "test/unit/search/tc_search_and_sort.rb", "test/unit/search/tc_sort.rb", "test/unit/search/tc_index_searcher.rb", "test/unit/search/tc_sort_field.rb", "test/unit/search/tm_searcher.rb", "test/unit/search/tc_fuzzy_query.rb", "test/unit/search/tc_filter.rb", "test/unit/search/tc_multiple_search_requests.rb", "test/unit/search/tc_spans.rb", "test/unit/search/tc_multi_searcher.rb", "test/unit/ts_search.rb", "test/unit/ts_store.rb", "test/unit/store/tc_fs_store.rb", "test/unit/store/tm_store.rb", "test/unit/store/tm_store_lock.rb", "test/unit/store/tc_ram_store.rb", "test/unit/ts_utils.rb", "test/unit/analysis/tc_token_stream.rb", "test/unit/analysis/tc_analyzer.rb", "test/unit/ts_largefile.rb", "test/unit/largefile/tc_largefile.rb", "test/test_all.rb", "test/threading/thread_safety_index_test.rb", "test/threading/number_to_spoken.rb", "test/threading/thread_safety_read_write_test.rb", "test/threading/thread_safety_test.rb", "test/test_helper.rb", "bin/ferret-browser", "ext/extconf.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://ferret.davebalmain.com/trac}
  s.rdoc_options = ["--title", "Ferret -- Ruby Indexer", "--main", "README", "--line-numbers", "TUTORIAL", "TODO"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new("> 0.0.0")
  s.rubyforge_project = %q{ferret}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Ruby indexing library.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 1

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rake>, ["> 0.0.0"])
    else
      s.add_dependency(%q<rake>, ["> 0.0.0"])
    end
  else
    s.add_dependency(%q<rake>, ["> 0.0.0"])
  end
end
