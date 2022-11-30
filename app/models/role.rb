class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        self.map{|a| a.actor}
    end

    def locations
        self.map{|a| a.locations}
    end

    def lead
        self.find_by(hired: true) || "no actor has been hired for this role"
    end

    def understudy
        self.where(hired: true).second || "no actor has been hired for understudy for this role"

end