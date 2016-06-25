class DeletePostIdColumnThenAddAgain < ActiveRecord::Migration
  def change

    remove_column :posts, :post_id, :string
    add_column :posts, :post_id, :integer

  end
end
