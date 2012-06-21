module EmailSpy
  class Message
    attr_reader :email
    attr_reader :attachments

    def initialize(location, email, part = nil)
      @location, @email, @part, @attachments = location, email, part, []
    end

    def render
      create_templates filepath, binding
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
      if content_type =~ /html/ then "rich" else "plain" end
    end

    def encoding
      if body.respond_to?(:encoding) then body.encoding else "utf-8" end
    private

    def create_templates(file_path, binding)
      FileUtils.mkdir_p @location

      File.open file_path, 'w' do |file|
        file.write ERB.new(template).result binding
      end
    end
    end
  end
end
