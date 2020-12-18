class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :firstName
      t.string :lastName
      t.string :email
      t.string :username
      t.string :password_digest
      t.string :bio
      t.string :occupation
      t.string :gender
      t.date :birthdate

      t.timestamps
    end
  end
end