class Paperclipdb::Attachment < ActiveRecord::Base
   attr_accessible :base_name, :dir_name, :file_data, :content_type, :file_size
end

