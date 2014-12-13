require 'curb'
require 'net/http'
require 'json'

%w(error configuration client).each do |m|
  require File.join(File.dirname(__FILE__), 'docomo_image_recognition', m)
end

module DocomoImageRecognition
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration
  end
end
