class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :website
      t.attachment :logo

      t.timestamps
    end
  end
end
