class BulkImagesDestroyJob < ApplicationJob
  queue_as :default

  def perform(image_ids: [], delete_all: false)
    if delete_all
      Image.delete_all
    else
      Image.where(id: image_ids).delete_all
    end
  end
end
