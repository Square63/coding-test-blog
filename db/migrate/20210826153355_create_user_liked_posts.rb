class CreateUserLikedPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :user_liked_posts do |t|
      t.references :user, foreign_key: true, index: true
      t.references :post, foreign_key: true, index: true

      t.timestamps
    end
  end
end
