require 'dotenv/load'
require 'roda'
require "json"
require 'sidekiq'
require 'sidekiq/web'
require 'erubi'
require "sinatra/activerecord"
require "./config/initializers/roda_ext"

Roda.class_eval { render_plugins }

@loaded_directories ||= Dir[
  File.join(__dir__, "/controllers/*.rb"),
  File.join(__dir__, "/models/*.rb"),
  File.join(__dir__, "/jobs/*.rb")
]

@loaded_directories.each do |file|
  require file
end

class App < Roda # :nodoc:
  route do |r|
    r.public

    r.root do
      view("home")
    end

    r.on 'users' do
      r.run UsersController
    end

    r.on 'logins' do
      r.run LoginsController
    end
  end
end
