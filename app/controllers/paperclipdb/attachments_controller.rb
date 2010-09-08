class Paperclipdb::AttachmentsController < ApplicationController
  
  def get_attachment
    dir_name = '/' + params[:dir_name].join('/') 
    base_name = params[:file_name] + '.' + params[:format]
    attachment = Paperclipdb::Attachment.find(:first, :conditions => [ "base_name = ? AND dir_name = ?", base_name, dir_name ])
    render :text => proc { |response, output|
        response.headers["Content-Type"] = attachment.content_type
        output.write(attachment.file_data)
    }
  end
  
end
