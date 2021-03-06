require_relative '../../spec_helper'
require 'optparse'

describe "OptionParser#parse" do
  ruby_version_is '2.4' do
    it "accepts `into` keyword argument and stores result in it" do
      options = {}
      parser = OptionParser.new do |opts|
        opts.on("-v", "--[no-]verbose", "Run verbosely")
        opts.on("-r", "--require LIBRARY", "Require the LIBRARY before executing your script")
      end
      parser.parse %w[--verbose --require optparse], into: options

      options.should == { verbose: true, require: "optparse" }
    end
  end
end

describe "OptionParser#parse!" do
  ruby_version_is '2.4' do
    it "accepts `into` keyword argument and stores result in it" do
      options = {}
      parser = OptionParser.new do |opts|
        opts.on("-v", "--[no-]verbose", "Run verbosely")
        opts.on("-r", "--require LIBRARY", "Require the LIBRARY before executing your script")
      end
      parser.parse! %w[--verbose --require optparse], into: options

      options.should == { verbose: true, require: "optparse" }
    end
  end
end
