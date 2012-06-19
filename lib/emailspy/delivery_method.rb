module LetterOpener
  class DeliveryMethod
    attr_accessor :settings

    def initialize(options = {})
      @settings = { location: File.join('.', 'letter_opener') }.merge! options
    end

    def deliver!(email)
      time = Time.now.to_i
      hash = Digest::SHA1.hexdigest(email.encoded)[0..6]
      location = File.join settings[:location], "#{time}_#{hash}"

      messages = email.parts.map { |part| Message.new location, email, part }
      messages << Message.new location, email if messages.empty?
      messages.each &:render

      Launchy.open URI.parse "file://#{messages.first.filepath}"
    end
  end
end
