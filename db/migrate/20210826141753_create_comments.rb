class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :description
      t.string :author_name
      t.integer :commentable_id, index: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
