module EmailSpy
  class DeliveryMethod
    attr_accessor :settings

    def initialize(options = {})
      @settings = { location: File.join('.', 'email_spy') }
      @settings.merge! options
    end

    def deliver!(email)
    def location(email, settings)
      File.join settings[:location], "#{Time.now.to_i}_#{digest email}"
    end

    def digest(email)
      Digest::SHA1.hexdigest(email.encoded)[0..6]
    end

    def messages(email, path)
      if email.parts.any?
        email.parts.map { |part| Message.new path, email, part }
      else
        [Message.new(path, email)]
      end.each &:render
    end

      Launchy.open URI.parse "file://#{messages.first.filepath}"
    end
  end
end
