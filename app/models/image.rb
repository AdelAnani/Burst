class Image < ApplicationRecord
    has_one_attached :asset

    def self.search(query)
        if query.blank?
            Image.all
        else
            Image.where("title LIKE :query", query: "%#{query}%")
        end
    end
end
