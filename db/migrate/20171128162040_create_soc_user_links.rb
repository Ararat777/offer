class CreateSocUserLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :soc_user_links do |t|
      t.string :link
      t.integer :status,default: 0
      t.belongs_to :user
      t.belongs_to :soc_network
      t.timestamps
    end
  end
end
