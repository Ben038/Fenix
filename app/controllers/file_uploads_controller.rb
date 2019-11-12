class FileUploadsController < ApplicationController

  def create
    @file_upload = FileUpload.new(file_upload_params)
    @file_upload.user = current_user
    if @file_upload.save
      redirect_to new_file_upload_path
    else
      render :new
    end
  end

  def new
    @file_upload = FileUpload.new
  end

  def index
    @file_uploads = FileUpload.all
  end

  def destroy
  end

  private

  def file_upload_params
    params.require(:file_upload).permit(:reinsurance_network, :balance_year, :quarter, :file_name)
  end
end


