require 'rack'
require 'grape'
require 'grape-entity'
require File.expand_path('../config/environment', __FILE__)
require File.expand_path('app/api/root', File.dirname(__FILE__))

run ::Api::Root
