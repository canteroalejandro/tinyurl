class Url < ApplicationRecord
    validates :url, presence: true, uniqueness: true
    validates :shorturl, presence: true, uniqueness: true
    
end
