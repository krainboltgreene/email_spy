module EmailSpy
  class Railtie < Rails::Railtie
    initializer "emailspy.add_delivery_method" do
      path_to_tmp = Rails.root.join "tmp", "email_spy"
      ActionMailer::Base.add_delivery_method :email_spy, EmailSpy::DeliveryMethod, location: path_to_tmp
    end
  end
end
