class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :member_only, :limit => 1

      t.timestamps
    end
  end
end
