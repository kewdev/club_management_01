class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.text :description
      t.string :phone
      t.string :email
      t.text :location
      t.timestamps
    end
  end
end
