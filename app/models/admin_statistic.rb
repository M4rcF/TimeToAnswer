class AdminStatistic < ApplicationRecord

    def self.set_statistic_admin(command)
        statistic = AdminStatistic.find_or_create_by(event: command)
        statistic.value += 1
        statistic.save
    end
end
