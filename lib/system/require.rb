# Basic requires, load gems from Gemfile
require 'rubygems'
require 'bundler/setup'
Bundler.require(:default, :development)

# Require system files
require_relative 'require.rb'
require_relative 'config.rb'
require_relative 'secrets.rb'

# Public: Load required files automatically
module System
  class Require
    AUTO_LOAD_PATHS = %w{ lib app/services app/models }

    # Public: resolve require dependencies; make best attempt to require all
    # files in the app.
    def call
      # transform folder paths into a list of all files to require
      AUTO_LOAD_PATHS
        .map{ |path| "#{App.root}/#{path}"  }
        .map{ |path| Dir["#{path}/**/*.rb"] }
        .flatten
        .each{ |path| require path }
    end
  end
end
