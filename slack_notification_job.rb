class SlackNotificationJob < ApplicationJob
  queue_as :default

  def perform(args)
    # Do something later
    Notifier.new.send_message(args)
  end
end
