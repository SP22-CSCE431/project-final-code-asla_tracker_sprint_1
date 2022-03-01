# frozen_string_literal: true

require 'active_support/core_ext/integer/time'

# The test environment is used exclusively to run your application's
# test suite. You never need to work with it otherwise. Remember that
# your test database is "scratch space" for the test suite and is wiped
# and recreated between test runs. Don't rely on the data there!

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  config.cache_classes = false
  config.action_view.cache_template_loading = true

  # Do not eager load code on boot. This avoids loading your whole application
  # just for the purpose of running a single test. If you are using a tool that
  # preloads Rails for running tests, you may have to set it to true.
  config.eager_load = false

  # Configure public file server for tests with Cache-Control for performance.
  config.public_file_server.enabled = true
  config.public_file_server.headers = {
    'Cache-Control' => "public, max-age=#{1.hour.to_i}"
  }

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  config.cache_store = :null_store

  # Raise exceptions instead of rendering exception templates.
  config.action_dispatch.show_exceptions = false

  # Disable request forgery protection in test environment.
  config.action_controller.allow_forgery_protection = false

  # Store uploaded files on the local file system in a temporary directory.
  config.active_storage.service = :test

  config.action_mailer.perform_caching = false

  # Tell Action Mailer not to deliver emails to the real world.
  # The :test delivery method accumulates sent emails in the
  # ActionMailer::Base.deliveries array.
  config.action_mailer.delivery_method = :test

  # Print deprecation notices to the stderr.
  config.active_support.deprecation = :stderr

  # Raise exceptions for disallowed deprecations.
  config.active_support.disallowed_deprecation = :raise

  # Tell Active Support which deprecation messages to disallow.
  config.active_support.disallowed_deprecation_warnings = []

  # Raises error for missing translations.
  # config.i18n.raise_on_missing_translations = true

  # Annotate rendered view with file names.
  # config.action_view.annotate_rendered_view_with_filenames = true

  # have mock information for OmniAuth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:google_user] = OmniAuth::AuthHash.new({
    provider: 'google_oauth2',
    uid: '123456789',
    info: {
      name: 'User Doe',
      email: 'userdoe@example.com',
      first_name: 'User',
      last_name: 'Doe',
      image: 'https://lh3.googleusercontent.com/url/photo.jpg'
    },
    credentials: {
      token: 'token',
      refresh_token: 'another_token',
      expires_at: 1_354_920_555,
      expires: true
    }
  }
                                                                  )

  OmniAuth.config.mock_auth[:google_admin] = OmniAuth::AuthHash.new({
    provider: 'google_oauth2',
    uid: '234567890',
    info: {
      name: 'Admin Doe',
      email: 'admindoe@example.com',
      first_name: 'Admin',
      last_name: 'Doe',
      image: 'https://lh3.googleusercontent.com/url/photo.jpg'
    },
    credentials: {
      token: 'token',
      refresh_token: 'another_token',
      expires_at: 1_354_920_555,
      expires: true
    }
  }
                                                                   )

  # mailer
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true
  config.action_mailer.smtp_settings = {
    address: 'smtp.gmail.com',
    port: 587,
    domain: 'example.com',
    user_name: ENV['MAILER_USERNAME'],
    password: ENV['MAILER_PASSWORD'],
    authentication: 'plain',
    enable_starttls_auto: true,
    open_timeout: 5,
    read_timeout: 5
  }
end
