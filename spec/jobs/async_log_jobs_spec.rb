require 'rails_helper'

RSpec.describe AsyncJob do
  it 'jobがキューに格納されること' do
    ActiveJob::Base.queue_adapter = :test
    expect { AsyncJob.perform_later }.to have_enqueued_job(AsyncJob)
  end
end