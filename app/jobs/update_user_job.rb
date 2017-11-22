class UpdateUserJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
    puts "Welcom #{user}"
    sleep 10
    puts "Bye"
  end
end
