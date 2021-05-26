class Subscription < ActiveRecord::Base
    
    belongs_to :reader
    belongs_to :magazine

    def reader
        Reader.find_by(id: self.reader_id)
    end

    def magazine
        Magazine.find_by(id: self.magazine_id)
    end
end