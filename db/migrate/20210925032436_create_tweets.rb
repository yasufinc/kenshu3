class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.string :content, null: false, default: ""
      t.integer :publicity, null: false, default: 0

      t.timestamps
    end
  end
end
