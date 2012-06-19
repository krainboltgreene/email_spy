require "fileutils"
require "digest/sha1"
require "cgi"
require "launchy"

require_relative "emailspy/message"
require_relative "emailspy/delivery_method"
require_relative "emailspy/railtie" if defined? Rails
