class AsyncJob < ApplicationJob

  def perform(message: 'hello hello hello')
    # retry_on StandardError, wait: 5.seconds, attenpts: 3
    AsyncLog.create!(message: message)
  end
end
