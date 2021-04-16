class ImportedFilesController < ApplicationController
  before_action :authenticate_user!

  def index
    @imported_files = ImportedFile.all
  end

  def new
    @import_file = ImportedFile.new
  end

  def import
    @import_files = current_user.imported_files.build(filename: params[:file].original_filename, state: '')
    if @import_files.save
      @import_files.import(params[:file], current_user)
      redirect_to contacts_path, notice: "The file was processed!"
    end
  end
end
