class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.attachment :avatar
      t.references :organization, foreign_key: true

      t.timestamps
    end
  end
end
