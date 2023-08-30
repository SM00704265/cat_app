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