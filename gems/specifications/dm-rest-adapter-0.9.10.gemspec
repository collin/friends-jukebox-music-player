# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{dm-rest-adapter}
  s.version = "0.9.10"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Potomac Ruby Hackers"]
  s.date = %q{2009-01-19}
  s.description = %q{REST Adapter for DataMapper}
  s.email = ["potomac-ruby-hackers [a] googlegroups [d] com"]
  s.extra_rdoc_files = ["README.txt", "LICENSE", "TODO", "History.txt"]
  s.files = ["History.txt", "LICENSE", "Manifest.txt", "README.txt", "Rakefile", "TODO", "fixtures/book_service/README", "fixtures/book_service/Rakefile", "fixtures/book_service/app/controllers/application.rb", "fixtures/book_service/app/controllers/books_controller.rb", "fixtures/book_service/app/controllers/shelves_controller.rb", "fixtures/book_service/app/helpers/application_helper.rb", "fixtures/book_service/app/helpers/books_helper.rb", "fixtures/book_service/app/helpers/shelf_helper.rb", "fixtures/book_service/app/models/book.rb", "fixtures/book_service/app/models/shelf.rb", "fixtures/book_service/app/views/books/edit.html.erb", "fixtures/book_service/app/views/books/index.html.erb", "fixtures/book_service/app/views/books/new.html.erb", "fixtures/book_service/app/views/books/show.html.erb", "fixtures/book_service/app/views/layouts/books.html.erb", "fixtures/book_service/app/views/shelves/edit.html.erb", "fixtures/book_service/app/views/shelves/index.html.erb", "fixtures/book_service/app/views/shelves/new.html.erb", "fixtures/book_service/app/views/shelves/show.html.erb", "fixtures/book_service/config/boot.rb", "fixtures/book_service/config/database.yml", "fixtures/book_service/config/environment.rb", "fixtures/book_service/config/environments/development.rb", "fixtures/book_service/config/environments/production.rb", "fixtures/book_service/config/environments/test.rb", "fixtures/book_service/config/initializers/inflections.rb", "fixtures/book_service/config/initializers/mime_types.rb", "fixtures/book_service/config/initializers/new_rails_defaults.rb", "fixtures/book_service/config/routes.rb", "fixtures/book_service/db/development.sqlite3", "fixtures/book_service/db/migrate/20080608165526_create_books.rb", "fixtures/book_service/db/migrate/20080621171551_create_shelves.rb", "fixtures/book_service/db/migrate/20080629143033_create_fake_books_and_shelves.rb", "fixtures/book_service/db/schema.rb", "fixtures/book_service/public/404.html", "fixtures/book_service/public/422.html", "fixtures/book_service/public/500.html", "fixtures/book_service/public/dispatch.cgi", "fixtures/book_service/public/dispatch.fcgi", "fixtures/book_service/public/dispatch.rb", "fixtures/book_service/public/favicon.ico", "fixtures/book_service/public/images/rails.png", "fixtures/book_service/public/index.html", "fixtures/book_service/public/javascripts/application.js", "fixtures/book_service/public/javascripts/controls.js", "fixtures/book_service/public/javascripts/dragdrop.js", "fixtures/book_service/public/javascripts/effects.js", "fixtures/book_service/public/javascripts/prototype.js", "fixtures/book_service/public/robots.txt", "fixtures/book_service/public/stylesheets/scaffold.css", "fixtures/book_service/script/about", "fixtures/book_service/script/console", "fixtures/book_service/script/dbconsole", "fixtures/book_service/script/destroy", "fixtures/book_service/script/generate", "fixtures/book_service/script/performance/benchmarker", "fixtures/book_service/script/performance/profiler", "fixtures/book_service/script/performance/request", "fixtures/book_service/script/plugin", "fixtures/book_service/script/process/inspector", "fixtures/book_service/script/process/reaper", "fixtures/book_service/script/process/spawner", "fixtures/book_service/script/runner", "fixtures/book_service/script/server", "fixtures/book_service/test/fixtures/books.yml", "fixtures/book_service/test/fixtures/shelves.yml", "fixtures/book_service/test/functional/books_controller_test.rb", "fixtures/book_service/test/functional/shelf_controller_test.rb", "fixtures/book_service/test/test_helper.rb", "fixtures/book_service/test/unit/book_test.rb", "fixtures/book_service/test/unit/shelf_test.rb", "lib/rest_adapter.rb", "lib/rest_adapter/version.rb", "spec/create_spec.rb", "spec/delete_spec.rb", "spec/read_spec.rb", "spec/ruby_forker.rb", "spec/spec.opts", "spec/spec_helper.rb", "spec/update_spec.rb", "stories/all.rb", "stories/crud/create", "stories/crud/delete", "stories/crud/read", "stories/crud/stories.rb", "stories/crud/update", "stories/helper.rb", "stories/resources/helpers/book.rb", "stories/resources/helpers/story_helper.rb", "stories/resources/steps/read.rb", "stories/resources/steps/using_rest_adapter.rb", "tasks/install.rb", "tasks/spec.rb", "tasks/stories.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/sam/dm-more/tree/master/adapters/dm-rest-adapter}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{datamapper}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{REST Adapter for DataMapper}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<dm-core>, ["~> 0.9.10"])
    else
      s.add_dependency(%q<dm-core>, ["~> 0.9.10"])
    end
  else
    s.add_dependency(%q<dm-core>, ["~> 0.9.10"])
  end
end
