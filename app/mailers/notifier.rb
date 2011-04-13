class Notifier < ActionMailer::Base
  COMMITTEE_ALIAS = ["gladneyfamilyreunion@gmail.com", "Antwan3000@gmail.com", "normanrobinson@sbcglobal.net", "vergiem@gmail.com"]
  #COMMITTEE_ALIAS = ["gladneyfamilyreunion@gmail.com"]
  default :from => "gladneyfamilyreunion@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.confirm_registration.subject
  #
  def confirm_registration(registrant)
    @name = registrant.full_name
    @email = registrant.email
    @confirmation = registrant.confirmation_num
    @trustee = registrant.payment_trustee
    @total = registrant.grand_total
    
    attachments['email-header.gif'] = File.read("#{Rails.root}/public/images/email-header.gif")

    mail :to => @email,
         :subject => "Gladney Reunion Confirmation: #{@name}",
         :cc => COMMITTEE_ALIAS
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.confirm_modification.subject
  #
  def confirm_modification(registrant)
    @greeting = "Hi"

    mail :to => "to@example.org"
  end
end
