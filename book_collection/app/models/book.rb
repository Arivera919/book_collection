class Book < ApplicationRecord
    validates :title, :author, :price, :publisheddate, presence: true
    validates :price, numericality: { greater_than: 0 }
    
end
