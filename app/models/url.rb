class Url < ApplicationRecord
    validates :url, presence: true, uniqueness: true
    validates :shorturl, presence: true, uniqueness: true
    
    def create_hash
        self.shorturl = SecureRandom.urlsafe_base64(10)
    end
end
