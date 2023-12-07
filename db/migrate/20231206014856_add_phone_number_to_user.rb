class AddPhoneNumberToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :phone_number, :string, :limit => 20, :unique => true
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
