class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :user #Creates a user_id field, aka foreign key, in the messages table we will make.
      t.string :tweet_id
      t.string :tweet_text
      t.integer :length
      t.boolean :bitlied, :default => false
      t.boolean :approved, :default => false 

      t.timestamps
    end
  end
end
