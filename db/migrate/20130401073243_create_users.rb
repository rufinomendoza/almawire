class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :uni
      t.string :college
      t.integer :year
      t.string :major
      t.string :industry
      t.string :location
      t.string :phone
      t.string :linkedin

      t.timestamps
    end
  end
end
