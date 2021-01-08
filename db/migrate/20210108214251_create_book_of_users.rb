class CreateBookOfUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :book_of_users do |t|
      t.integer :status
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
