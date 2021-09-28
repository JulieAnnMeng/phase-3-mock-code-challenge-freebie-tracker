class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        self.freebies.map do |freebie|
            if freebie.item_name.downcase == item_name.downcase
                true
            else
                false
            end
        end
    end

    def give_away(dev, freebie)
        if self.received_one?(freebie.item_name)
            self.freebies.update(dev: dev)
        else
            "#{self} does not have #{freebie}"
        end
    end
end
