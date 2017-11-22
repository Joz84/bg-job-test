desc "Update user"
task :update_user => :environment do
  puts "Go"
  UpdateUserJob.perform_later(2)
  puts "done."
end

namespace :user do
  desc "Enriching a given user with Clearbit (sync)"
  task :update, [:user_id] => :environment do |t, args|
    user = User.find(args[:user_id])
    puts "Enriching #{user.email}..."
    UpdateUserJob.perform_now(user.id)
    # rake task will return when job is _done_
  end
end
