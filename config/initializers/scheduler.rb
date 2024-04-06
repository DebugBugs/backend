require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.every '10s' do
    users = User.all
    users.each do |user|
        energy_usage = rand(1..30)
        record = Record.new(user_id: user.id, energy_usage: energy_usage)
        if energy_usage > 15 
            user.health -= 5
        end
        if user.health > 50
            user.level = "healthy"
        elsif user.health > 30
            user.level = "damaged"
        elsif user.health > 0
            user.level = "critical"
        else 
            user.level = "dead"
        end
        user.save
        record.save
    end
  end