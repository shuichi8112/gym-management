class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string     :name,              null: false
      t.integer    :gender_id,         null: false
      t.string     :address,           null: false
      t.string     :phone_number,      null: false
      t.string     :email,             null: false
      t.references :user,              foreign_key: true

      t.timestamps
    end
  end
end
