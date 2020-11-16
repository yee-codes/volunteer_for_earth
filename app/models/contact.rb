class Contact < MailForm::Base
    # Contact form attributes and validations
    attribute :name, :validate => true
    attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
    attribute :message,   :validate => true
    attribute :nickname,  :captcha  => true

    # Configure contact form to be sent to site admin
    def headers
      {
        :subject => "Volunteer for Earth",
        :to => "shaoyee.ng@gmail.com",
        :from => %("#{name}" <#{email}>)
      }
    end
  end