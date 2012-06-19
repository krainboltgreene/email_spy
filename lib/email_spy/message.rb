module EmailSpy
  class Message
    attr_reader :email

    def initialize(location, email, part = nil)
      @location = location
      @email = email
      @part = part
    end

    def render
      FileUtils.mkdir_p @location

      File.open filepath, 'w' do |file|
        file.write ERB.new(template).result binding
      end
    end

    def template
      File.read File.expand_path File.join("..", "message.html.erb"), __FILE__
    end

    def filepath
      File.join @location, "#{type}.html"
    end

    def content_type
      @part && @part.content_type || @email.content_type
    end

    def body
      @body ||= (@part && @part.body || @email.body).to_s
    end

    def from
      @from ||= @email.from.kind_of?(Array) && @email.from.join(", ") || @email.from
    end

    def type
      content_type =~ /html/ ? "rich" : "plain"
    end

    def encoding
      body.respond_to?(:encoding) ? body.encoding : "utf-8"
    end
  end
end
