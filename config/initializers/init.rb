require 'dotenv/load'
require 'roda'
require "json"
require 'sidekiq'
require 'sidekiq/web'
require 'erubi'
require "sinatra/activerecord"
require_relative "roda_ext"

Roda.class_eval { render_plugins }

@required_files ||= Dir[
  File.join(__dir__, "../../controllers/*.rb"),
  File.join(__dir__, "../../models/*.rb"),
  File.join(__dir__, "../../jobs/*.rb")
]

@required_files.each { |file| require file }
