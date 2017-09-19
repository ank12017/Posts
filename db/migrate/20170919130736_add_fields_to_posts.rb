class AddFieldsToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :post_file_name, :string
    add_column :posts, :post_content_type, :string
    add_column :posts, :post_file_size, :integer
    add_column :posts, :post_updated_at, :datetime
  end
end
