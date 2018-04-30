class AddTitleToPostImage < ActiveRecord::Migration[5.1]
  def change
    add_column :post_images, :title, :string
  end
end
