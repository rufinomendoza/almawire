class ChangeUniColumnInUsers < ActiveRecord::Migration
  def change
    rename_column :users, :uni, :university
  end

end
