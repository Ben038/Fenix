class FileUploadsController < ApplicationController

  def create
    @file_upload = FileUpload.new(file_upload_params)
    @file_upload.user = current_user
    if @file_upload.save
      redirect_to new_file_upload_path, alert: "#{@file_upload.file_name} has been uploaded!"
    else
      render :new
    end
  end

  def new
    @file_upload = FileUpload.new
  end

  def index
  end

  def destroy
  end

  private

  def file_upload_params
    params.require(:file_upload).permit(:reinsurance_network, :balance_year, :quarter, :file_name)
  end
end


