module EmailSpy
  class DeliveryMethod
    attr_accessor :settings

    def initialize(options = {})
      @settings = { location: File.join('.', 'email_spy') }
      @settings.merge! options
    end

    def deliver!(email)
      time = Time.now.to_i
      hash = Digest::SHA1.hexdigest(email.encoded)[0..6]
      location = File.join settings[:location], "#{time}_#{hash}"

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
