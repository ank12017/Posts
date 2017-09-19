class Upload < ApplicationRecord
	
	def to_jq_upload
	    {
	      "name" => read_attribute(:upload_file_name),
	      "size" => read_attribute(:upload_file_size),
	      "url" => upload.url(:original),
	      "delete_url" => upload_path(self),
	      "delete_type" => "DELETE" 
	    }
	end
end