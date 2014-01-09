class Users < ActiveRecord::Migration
  def up
    
    create_table :users do |t|
      t.string :name
      t.timestamps
    end
    
  end

  def down
  end
end
