class Subscription < ActiveRecord::Base
    
    belongs_to :reader
    belongs_to :magazine

    # def reader
    #     Reader.find_by(id: self.reader_id)
    # end

    # def magazine
    #     Magazine.find_by(id: self.magazine_id)
    # end

    def print_details
        # self.reader.name
        # self.reader.magazine.name
        reader = Reader.find_by(id: self.reader_id).name
        magazine = Magazine.find_by(id: self.magazine_id).title
        puts "#{reader} subscribed to #{magazine} for $#{self.price}"
    end
end