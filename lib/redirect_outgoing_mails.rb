class RedirectOutgoingMails
  class << self
    def delivering_email(mail)
      mail.to = "joseph@contractiq.in"
      mail.cc = "joseph@contractiq.in" if !mail.cc.nil?
      mail.bcc = "joseph@contractiq.in" if !mail.bcc.nil?
    end
  end
end