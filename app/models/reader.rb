class Reader < ActiveRecord::Base
    
    has_many :subscriptions
    has_many :magazines, through: :subscriptions

    def subscribe(magazine, price)
        # ALTERNATE SOLUTION self.subscriptions.create(magazine_id: magazine.id, price: price)
        Subscription.create(reader_id: self.id, magazine_id: magazine.id, price: price)
    end

    def total_subscription_price
        # ALTERNATE SOLUTION  self.subscriptions.sum{|sub| sub.price}
        self.subscriptions.sum(:price)
    end

    def cancel_subscriptions(magazine)
        # ALTERNATE SOLUTION self.subscriptions.find_by(magazine_id: magazine.magazine_id).destroy
        Subscription.find_by(reader_id: self.id, magazine_id: magazine.id).destroy
    end
end