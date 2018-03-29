require 'active_record'
require 'active_record/railtie'
require_relative 'boot'
require_relative 'connection'

module Rankme
  class Application < ::Rails::Application
  end
end

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'api'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'app'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

Bundler.require :default, ENV['RANKME_ENV']

Dir.glob(File.join('../app', '**', '*.rb'), &method(:require))
