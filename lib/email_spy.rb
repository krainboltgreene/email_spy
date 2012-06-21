require "fileutils"
require "digest/sha1"
require "cgi"
require "uri"
require "launchy"

require_relative "email_spy/message"
require_relative "email_spy/delivery_method"
require_relative "email_spy/railtie" if defined? Rails
