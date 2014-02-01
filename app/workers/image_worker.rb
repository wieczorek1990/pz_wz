class ImageWorker
  include Sidekiq::Worker

  def perform
    puts 'hello'
  end
end