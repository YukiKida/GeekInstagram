class AddUserToImgposts < ActiveRecord::Migration[6.1]
  def change
    add_column :imgposts, :user_id, :integer
  end
end
