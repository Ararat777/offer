class CreateInvitedUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :invited_users do |t|
      t.string :link
      t.integer :status,default: 0
      t.belongs_to :soc_network
      t.belongs_to :user
      t.timestamps
    end
  end
end
