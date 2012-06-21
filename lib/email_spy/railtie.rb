module EmailSpy
  class Railtie < Rails::Railtie
    initializer "emailspy.add_delivery_method" do
      path_to_emails = Rails.root.join "tmp", EMAIL_DIRECTORY_NAME
      ActionMailer::Base.add_delivery_method :email_spy, EmailSpy::DeliveryMethod, location: path_to_emails
    end
  end
end
