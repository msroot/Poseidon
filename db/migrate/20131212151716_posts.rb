class Posts < ActiveRecord::Migration
  def up
        create_table :posts do |t|
          t.string :title
          t.string :body
          t.timestamps
        end

  end

  def down
  end
end
