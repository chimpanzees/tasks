class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, :last_name, :email_address, :atech_identity_key, :username
      t.boolean :noti, :default => false
      t.timestamps
    end
  end
end
