class FakeJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "Je commence"
    sleep 3
    puts "C'est fini"
  end
end
