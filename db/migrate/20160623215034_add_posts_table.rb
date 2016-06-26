class AddPostsTable < ActiveRecord::Migration
  def change

    create_table :posts do |t|
      t.string :title
      t.text  :body  #actually, reddits don't have body but leaving in case useful later
      t.timestamps
    end

  end
end
