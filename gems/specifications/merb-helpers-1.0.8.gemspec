# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{merb-helpers}
  s.version = "1.0.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Michael D. Ivey"]
  s.date = %q{2009-01-16}
  s.description = %q{Helper support for Merb}
  s.email = %q{ivey@gweezlebur.com}
  s.extra_rdoc_files = ["README", "LICENSE", "TODO"]
  s.files = ["LICENSE", "README", "Rakefile", "TODO", "lib/merb-helpers", "lib/merb-helpers/core_ext", "lib/merb-helpers/core_ext/numeric.rb", "lib/merb-helpers/core_ext.rb", "lib/merb-helpers/date_time_formatting.rb", "lib/merb-helpers/date_time_helpers.rb", "lib/merb-helpers/form", "lib/merb-helpers/form/builder.rb", "lib/merb-helpers/form/helpers.rb", "lib/merb-helpers/form_helpers.rb", "lib/merb-helpers/tag_helpers.rb", "lib/merb-helpers/text_helpers.rb", "lib/merb-helpers/time_dsl.rb", "lib/merb-helpers.rb", "spec/core_ext_spec.rb", "spec/fixture", "spec/fixture/app", "spec/fixture/app/controllers", "spec/fixture/app/controllers/application.rb", "spec/fixture/app/controllers/bound_check_box.rb", "spec/fixture/app/controllers/bound_file_field.rb", "spec/fixture/app/controllers/bound_hidden_field.rb", "spec/fixture/app/controllers/bound_option_tag.rb", "spec/fixture/app/controllers/bound_password_field.rb", "spec/fixture/app/controllers/bound_radio_button.rb", "spec/fixture/app/controllers/bound_radio_group.rb", "spec/fixture/app/controllers/bound_select.rb", "spec/fixture/app/controllers/bound_text_area.rb", "spec/fixture/app/controllers/bound_text_field.rb", "spec/fixture/app/controllers/button.rb", "spec/fixture/app/controllers/check_box.rb", "spec/fixture/app/controllers/custom_builder.rb", "spec/fixture/app/controllers/delete_button.rb", "spec/fixture/app/controllers/exceptions.rb", "spec/fixture/app/controllers/field_set.rb", "spec/fixture/app/controllers/fields_for.rb", "spec/fixture/app/controllers/file_field.rb", "spec/fixture/app/controllers/foo.rb", "spec/fixture/app/controllers/form.rb", "spec/fixture/app/controllers/form_for.rb", "spec/fixture/app/controllers/hacker.rb", "spec/fixture/app/controllers/hidden_field.rb", "spec/fixture/app/controllers/label.rb", "spec/fixture/app/controllers/numeric_ext.rb", "spec/fixture/app/controllers/option_tag.rb", "spec/fixture/app/controllers/password_field.rb", "spec/fixture/app/controllers/radio_button.rb", "spec/fixture/app/controllers/radio_group.rb", "spec/fixture/app/controllers/relative_date.rb", "spec/fixture/app/controllers/relative_date_span.rb", "spec/fixture/app/controllers/select.rb", "spec/fixture/app/controllers/specs_controller.rb", "spec/fixture/app/controllers/submit.rb", "spec/fixture/app/controllers/tag_helper.rb", "spec/fixture/app/controllers/text_area.rb", "spec/fixture/app/controllers/text_field.rb", "spec/fixture/app/helpers", "spec/fixture/app/helpers/global_helpers.rb", "spec/fixture/app/models", "spec/fixture/app/models/fake_dm_model.rb", "spec/fixture/app/models/first_generic_fake_model.rb", "spec/fixture/app/models/hacker_generic_model.rb", "spec/fixture/app/models/second_generic_fake_model.rb", "spec/fixture/app/models/third_generic_fake_model.rb", "spec/fixture/app/views", "spec/fixture/app/views/bound_check_box_specs", "spec/fixture/app/views/bound_check_box_specs/basic.html.erb", "spec/fixture/app/views/bound_check_box_specs/checked.html.erb", "spec/fixture/app/views/bound_check_box_specs/errors.html.erb", "spec/fixture/app/views/bound_check_box_specs/label.html.erb", "spec/fixture/app/views/bound_check_box_specs/on_and_off.html.erb", "spec/fixture/app/views/bound_check_box_specs/raise_value_error.html.erb", "spec/fixture/app/views/bound_file_field_specs", "spec/fixture/app/views/bound_file_field_specs/additional_attributes.html.erb", "spec/fixture/app/views/bound_file_field_specs/takes_string.html.erb", "spec/fixture/app/views/bound_file_field_specs/with_label.html.erb", "spec/fixture/app/views/bound_hidden_field_specs", "spec/fixture/app/views/bound_hidden_field_specs/basic.html.erb", "spec/fixture/app/views/bound_hidden_field_specs/errors.html.erb", "spec/fixture/app/views/bound_hidden_field_specs/hidden_error.html.erb", "spec/fixture/app/views/bound_hidden_field_specs/label.html.erb", "spec/fixture/app/views/bound_option_tag_specs", "spec/fixture/app/views/bound_option_tag_specs/grouped.html.erb", "spec/fixture/app/views/bound_option_tag_specs/nested.html.erb", "spec/fixture/app/views/bound_option_tag_specs/text_and_value.html.erb", "spec/fixture/app/views/bound_password_field_specs", "spec/fixture/app/views/bound_password_field_specs/attributes.html.erb", "spec/fixture/app/views/bound_password_field_specs/basic.html.erb", "spec/fixture/app/views/bound_password_field_specs/label.html.erb", "spec/fixture/app/views/bound_radio_button_specs", "spec/fixture/app/views/bound_radio_button_specs/basic.html.erb", "spec/fixture/app/views/bound_radio_group_specs", "spec/fixture/app/views/bound_radio_group_specs/basic.html.erb", "spec/fixture/app/views/bound_radio_group_specs/hashes.html.erb", "spec/fixture/app/views/bound_radio_group_specs/mixed.html.erb", "spec/fixture/app/views/bound_radio_group_specs/override_id.html.erb", "spec/fixture/app/views/bound_select_specs", "spec/fixture/app/views/bound_select_specs/basic.html.erb", "spec/fixture/app/views/bound_select_specs/blank.html.erb", "spec/fixture/app/views/bound_select_specs/multiple.html.erb", "spec/fixture/app/views/bound_select_specs/prompt.html.erb", "spec/fixture/app/views/bound_select_specs/with_options.html.erb", "spec/fixture/app/views/bound_select_specs/with_options_with_blank.html.erb", "spec/fixture/app/views/bound_text_area_specs", "spec/fixture/app/views/bound_text_area_specs/basic.html.erb", "spec/fixture/app/views/bound_text_field_specs", "spec/fixture/app/views/bound_text_field_specs/basic.html.erb", "spec/fixture/app/views/button_specs", "spec/fixture/app/views/button_specs/button_with_label.html.erb", "spec/fixture/app/views/button_specs/button_with_values.html.erb", "spec/fixture/app/views/button_specs/disabled_button.html.erb", "spec/fixture/app/views/check_box_specs", "spec/fixture/app/views/check_box_specs/basic.html.erb", "spec/fixture/app/views/check_box_specs/boolean.html.erb", "spec/fixture/app/views/check_box_specs/disabled.html.erb", "spec/fixture/app/views/check_box_specs/label.html.erb", "spec/fixture/app/views/check_box_specs/on_off_is_boolean.html.erb", "spec/fixture/app/views/check_box_specs/raise_unless_both_on_and_off.html.erb", "spec/fixture/app/views/check_box_specs/raises_error_if_not_boolean.html.erb", "spec/fixture/app/views/check_box_specs/raises_error_if_on_off_and_boolean_false.html.erb", "spec/fixture/app/views/check_box_specs/simple.html.erb", "spec/fixture/app/views/check_box_specs/to_string.html.erb", "spec/fixture/app/views/check_box_specs/unchecked.html.erb", "spec/fixture/app/views/custom_builder_specs", "spec/fixture/app/views/custom_builder_specs/everything.html.erb", "spec/fixture/app/views/delete_button_specs", "spec/fixture/app/views/delete_button_specs/delete_with_explicit_url.html.erb", "spec/fixture/app/views/delete_button_specs/delete_with_extra_params.html.erb", "spec/fixture/app/views/delete_button_specs/delete_with_label.html.erb", "spec/fixture/app/views/delete_button_specs/simple_delete.html.erb", "spec/fixture/app/views/exeptions", "spec/fixture/app/views/exeptions/client_error.html.erb", "spec/fixture/app/views/exeptions/internal_server_error.html.erb", "spec/fixture/app/views/exeptions/not_acceptable.html.erb", "spec/fixture/app/views/exeptions/not_found.html.erb", "spec/fixture/app/views/fields_for_specs", "spec/fixture/app/views/fields_for_specs/basic.html.erb", "spec/fixture/app/views/fields_for_specs/midstream.html.erb", "spec/fixture/app/views/fields_for_specs/nil.html.erb", "spec/fixture/app/views/fieldset_specs", "spec/fixture/app/views/fieldset_specs/legend.html.erb", "spec/fixture/app/views/file_field_specs", "spec/fixture/app/views/file_field_specs/disabled.html.erb", "spec/fixture/app/views/file_field_specs/makes_multipart.html.erb", "spec/fixture/app/views/file_field_specs/with_label.html.erb", "spec/fixture/app/views/file_field_specs/with_values.html.erb", "spec/fixture/app/views/foo", "spec/fixture/app/views/foo/bar.html.erb", "spec/fixture/app/views/form_for_specs", "spec/fixture/app/views/form_for_specs/basic.html.erb", "spec/fixture/app/views/form_specs", "spec/fixture/app/views/form_specs/create_a_form.html.erb", "spec/fixture/app/views/form_specs/create_a_multipart_form.html.erb", "spec/fixture/app/views/form_specs/fake_delete_if_set.html.erb", "spec/fixture/app/views/form_specs/fake_put_if_set.html.erb", "spec/fixture/app/views/form_specs/get_if_set.html.erb", "spec/fixture/app/views/form_specs/post_by_default.html.erb", "spec/fixture/app/views/form_specs/resourceful_form.html.erb", "spec/fixture/app/views/hacker", "spec/fixture/app/views/hacker/file_field.html.erb", "spec/fixture/app/views/hacker/hidden_field.html.erb", "spec/fixture/app/views/hacker/option_tag.html.erb", "spec/fixture/app/views/hacker/password_field.html.erb", "spec/fixture/app/views/hacker/radio_button.html.erb", "spec/fixture/app/views/hacker/radio_group.html.erb", "spec/fixture/app/views/hacker/text_area.html.erb", "spec/fixture/app/views/hacker/text_field.html.erb", "spec/fixture/app/views/hidden_field_specs", "spec/fixture/app/views/hidden_field_specs/basic.html.erb", "spec/fixture/app/views/hidden_field_specs/disabled.html.erb", "spec/fixture/app/views/hidden_field_specs/label.html.erb", "spec/fixture/app/views/label_specs", "spec/fixture/app/views/label_specs/basic.html.erb", "spec/fixture/app/views/label_specs/basic_with_attributes.html.erb", "spec/fixture/app/views/label_specs/basic_with_class.html.erb", "spec/fixture/app/views/layout", "spec/fixture/app/views/layout/application.html.erb", "spec/fixture/app/views/numeric_ext_specs", "spec/fixture/app/views/numeric_ext_specs/minutes_to_hours.html.erb", "spec/fixture/app/views/numeric_ext_specs/to_concurrency_default.html.erb", "spec/fixture/app/views/numeric_ext_specs/two_digits.html.erb", "spec/fixture/app/views/option_tag_specs", "spec/fixture/app/views/option_tag_specs/array.html.erb", "spec/fixture/app/views/option_tag_specs/clean.html.erb", "spec/fixture/app/views/option_tag_specs/collection.html.erb", "spec/fixture/app/views/option_tag_specs/multiple_selects.html.erb", "spec/fixture/app/views/option_tag_specs/no_extra_attributes.html.erb", "spec/fixture/app/views/option_tag_specs/optgroups.html.erb", "spec/fixture/app/views/option_tag_specs/selected.html.erb", "spec/fixture/app/views/option_tag_specs/with_blank.html.erb", "spec/fixture/app/views/option_tag_specs/with_prompt.html.erb", "spec/fixture/app/views/password_field_specs", "spec/fixture/app/views/password_field_specs/basic.html.erb", "spec/fixture/app/views/password_field_specs/disabled.html.erb", "spec/fixture/app/views/radio_button_specs", "spec/fixture/app/views/radio_button_specs/basic.html.erb", "spec/fixture/app/views/radio_button_specs/disabled.html.erb", "spec/fixture/app/views/radio_button_specs/label.html.erb", "spec/fixture/app/views/radio_group_specs", "spec/fixture/app/views/radio_group_specs/attributes.html.erb", "spec/fixture/app/views/radio_group_specs/basic.html.erb", "spec/fixture/app/views/radio_group_specs/hash.html.erb", "spec/fixture/app/views/radio_group_specs/specific_attributes.html.erb", "spec/fixture/app/views/relative_date_span_specs", "spec/fixture/app/views/relative_date_span_specs/date_span_on_same_day.html.erb", "spec/fixture/app/views/relative_date_span_specs/date_span_on_same_day_on_different_year.html.erb", "spec/fixture/app/views/relative_date_specs", "spec/fixture/app/views/relative_date_specs/relative_date_with_year.html.erb", "spec/fixture/app/views/relative_date_specs/relative_date_without_year.html.erb", "spec/fixture/app/views/relative_date_specs/relative_today.html.erb", "spec/fixture/app/views/relative_date_specs/relative_tomorrow.html.erb", "spec/fixture/app/views/relative_date_specs/relative_yesterday.html.erb", "spec/fixture/app/views/select_specs", "spec/fixture/app/views/select_specs/blank.html.erb", "spec/fixture/app/views/select_specs/multiple.html.erb", "spec/fixture/app/views/submit_specs", "spec/fixture/app/views/submit_specs/disabled_submit.html.erb", "spec/fixture/app/views/submit_specs/submit_with_label.html.erb", "spec/fixture/app/views/submit_specs/submit_with_values.html.erb", "spec/fixture/app/views/tag_helper", "spec/fixture/app/views/tag_helper/nested_tags.html.erb", "spec/fixture/app/views/tag_helper/tag_with_attributes.html.erb", "spec/fixture/app/views/tag_helper/tag_with_content.html.erb", "spec/fixture/app/views/tag_helper/tag_with_content_in_the_block.html.erb", "spec/fixture/app/views/text_area_specs", "spec/fixture/app/views/text_area_specs/basic.html.erb", "spec/fixture/app/views/text_area_specs/disabled.html.erb", "spec/fixture/app/views/text_area_specs/label.html.erb", "spec/fixture/app/views/text_area_specs/nil.html.erb", "spec/fixture/app/views/text_field_specs", "spec/fixture/app/views/text_field_specs/basic.html.erb", "spec/fixture/app/views/text_field_specs/class.html.erb", "spec/fixture/app/views/text_field_specs/disabled.html.erb", "spec/fixture/app/views/text_field_specs/label.html.erb", "spec/fixture/config", "spec/fixture/config/environments", "spec/fixture/config/environments/development.rb", "spec/fixture/config/environments/production.rb", "spec/fixture/config/environments/test.rb", "spec/fixture/config/init.rb", "spec/fixture/config/rack.rb", "spec/fixture/config/router.rb", "spec/fixture/public", "spec/fixture/public/images", "spec/fixture/public/images/merb.jpg", "spec/fixture/public/merb.fcgi", "spec/fixture/public/stylesheets", "spec/fixture/public/stylesheets/master.css", "spec/merb.main.pid", "spec/merb_helpers_config_spec.rb", "spec/merb_helpers_date_time_spec.rb", "spec/merb_helpers_form_spec.rb", "spec/merb_helpers_tag_helper_spec.rb", "spec/merb_helpers_text_spec.rb", "spec/merb_test.log", "spec/numeric_extlib_spec.rb", "spec/ordinalize_spec.rb", "spec/spec_helper.rb", "spec/time_dsl_spec.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://merbivore.com}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{merb}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Helper support for Merb}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<merb-core>, [">= 1.0.8"])
    else
      s.add_dependency(%q<merb-core>, [">= 1.0.8"])
    end
  else
    s.add_dependency(%q<merb-core>, [">= 1.0.8"])
  end
end
