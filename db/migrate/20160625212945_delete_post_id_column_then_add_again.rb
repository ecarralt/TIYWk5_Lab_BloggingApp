class DeletePostIdColumnThenAddAgain < ActiveRecord::Migration
  def change

    remove_column :comments, :post_id, :string
    add_column :comments, :post_id, :integer

  end
end
