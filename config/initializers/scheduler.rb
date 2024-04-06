require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.every '30s' do
    users = User.all
    users.each do |user|
        energy_usage = rand(1..30)
        record = Record.new(user_id: user.id, energy_usage: energy_usage)

        #update user health
        if energy_usage > 15 
            user.health -= 5
        elsif energy_usage < 15 && user.health < 100
            user.health += 5
        end

        #update user status
        if user.health > 50
            user.status = "healthy"
        elsif user.health > 30
            user.status = "damaged"
        elsif user.health > 0
            user.status = "critical"
        else 
            user.status = "dead"
        end

        user.save
        record.save
    end
  end