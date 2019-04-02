class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text     :comment
      t.integer  :company_id
      t.integer  :user_id

      t.timestamps
    end
    add_index :reviews, [:company_id, :user_id], unique: true
  end
end
