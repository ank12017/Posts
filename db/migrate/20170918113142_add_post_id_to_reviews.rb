class AddPostIdToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :post_id, :integer
  end
end
