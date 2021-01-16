class BulkImagesController < ApplicationController
    def index
        @bulk_image_decorator = nil
    end
    
    def create
        BulkImagesCreationJob.perform_later(assets: params['assets'])

        respond_to do |format|
            format.html { redirect_to '/images', notice: 'Images are uploading in the background...'}
            format.json { render :show, status: created }
        end
    end

    def destroy
        BulkImagesDestroyJob.perform_later(delete_all: true)

        respond_to do |format|
            format.html { redirect_to images_url, notice: 'Image are deleted in the background...' }
            format.json { head :no_content }
        end
    end
end