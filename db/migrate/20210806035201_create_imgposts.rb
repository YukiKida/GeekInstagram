class CreateImgposts < ActiveRecord::Migration[6.1]
  def change
    create_table :imgposts do |t|
      t.text :title
      t.text :body
      t.string :image

      t.timestamps
    end
  end
end
