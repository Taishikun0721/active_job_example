class RemindWorker
  include Sidekiq::Worker
  sidekiq_options queue: :remind

  def perform(*arg)
    User.create(name: Faker::Name.unique.name, email: Faker::Internet.email)
  end
end