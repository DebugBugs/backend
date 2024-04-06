require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.every '10s' do
    users = User.all
    users.each do |user|
        record = Record.new(user_id: user.id, energy_usage: rand(1..10))
        record.save
    end
  end