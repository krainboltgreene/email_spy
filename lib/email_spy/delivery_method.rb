module EmailSpy
  class DeliveryMethod
    attr_accessor :settings

    def initialize(options = {})
      @settings = { location: email_directory }
      @settings.merge! options
    end

    def deliver!(email)
      launch messages(email, location(email, settings))
    end

    private

    def location(email, settings)
      File.join settings[:location], "#{Time.now.to_i}_#{digest email}"
    end

    def digest(email)
      Digest::SHA1.hexdigest(email.encoded)[0..6]
    end

    def messages(email, path)
      if email.html_part || email.text_part
        [email.html_part, email.text_part].compact.map do |part|
          Message.new path, email, part
        end
      else
        [Message.new(path, email)]
      end.each &:render
    end

    def launch(messages)
      Launchy.open URI.parse "file://#{messages.first.filepath}"
    end

    def email_directory
      if defined?(Rails)
        Rails.root.join "tmp", EMAIL_DIRECTORY_NAME
      else
        File.join '.', EMAIL_DIRECTORY_NAME
      end
    end
  end
end
