module EmailSpy
  class Railtie < Rails::Railtie
    initializer "emailspy.add_delivery_method" do
      ActionMailer::Base.add_delivery_method :email_spy, EmailSpy::DeliveryMethod, location: Rails.root.join("tmp", "email_spy")
    end
  end
end
