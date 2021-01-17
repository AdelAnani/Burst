class Image < ApplicationRecord
    has_one_attached :asset

    def self.search(query)
        if query.blank?
            Image.all
        else
            Image.where("title LIKE :query", query: "%#{query}%")
        end
    end

    private

    def validate_asset
        if asset.attached? && !asset.image?
            document.purge # delete the uploaded file
            errors.add(:document, 'Must be a PDF or a DOC file')
        end
    end

end
