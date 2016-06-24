class AddUserNameAndModifyPostidToInteger < ActiveRecord::Migration
  def change

    change_column :comments, :post_id, :integer
    add_column :comments, :username, :string

  end
end
