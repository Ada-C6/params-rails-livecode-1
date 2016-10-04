class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.string :author
      t.references :post, index: true, foreign_key: true
      #t.integer :post_id, index: true

      t.timestamps null: false
    end
  end
end
