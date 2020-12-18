class CreateBulletins < ActiveRecord::Migration[6.0]
  def change
    create_table :bulletins do |t|
      t.string :message
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
