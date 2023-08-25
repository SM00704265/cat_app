class Notifier
  def initialize
  	@message_notifier = Slack::Notifier.new "https://hooks.slack.com/services/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" do
      defaults channel: "#qa",
           username: "notifier"
    end
  end

  def send_message(message)
    @message_notifier.ping(message)
  end
end