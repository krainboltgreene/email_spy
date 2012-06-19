module Emailspy
  class Railtie < Rails::Railtie
    initializer "emailspy.add_delivery_method" do
      ActionMailer::Base.add_delivery_method :emailspy, Emailspy::DeliveryMethod, location: Rails.root.join("tmp", "emailspy")
    end
  end
end
