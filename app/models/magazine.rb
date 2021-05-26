class Magazine < ActiveRecord::Base
    
    has_many :subscriptions
    has_many :readers, through: :subscriptions

    def email_list
        self.readers.map{|reader| reader.email}.join(";")
    end

    def self.most_popular
        
    end
end