class ApplicationMailer < ActionMailer::Base
  default from: "bob@wrightco.com"
  layout 'mailer'
end
