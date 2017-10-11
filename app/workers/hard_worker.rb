class HardWorker
  include Sidekiq::Worker

  def performa()
    # Do something
    Article.update_all(read_number: 0)
  end
end
