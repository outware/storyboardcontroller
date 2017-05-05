# Load the build variables
require_relative "config"

# Load the gem
require 'bundler/setup'
require 'omrakelib-ios'

# This is needed to get a handle back to this directory
ROOT_DIR = __FILE__

# Goes through all the rake files stored in the gem and loads them as a rake task
OMRakeLib_IOS.setup

# The following was here before
#desc "Set default task to build:dev"
#task :default => [:'build:dev']
