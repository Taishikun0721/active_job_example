class RemindJob < ApplicationJob
  queue_as :remind
  def perform(*args)
    
  end
end
