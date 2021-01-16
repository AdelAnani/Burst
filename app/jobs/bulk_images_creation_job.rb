class BulkImagesCreationJob < ApplicationJob
  queue_as :default

  def perform(assets:)
    assets.each do |asset_id|
      image = Image.new
      image.asset.attach(asset_id)
      puts image.asset.filename, "FILENAMEEEEE"
      image.title = image.asset.filename
      image.save
    end
  end
end
