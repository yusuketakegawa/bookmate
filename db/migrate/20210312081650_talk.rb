class Talk < ActiveRecord::Migration[6.0]
  def change
    drop_table :talks
  end
end
