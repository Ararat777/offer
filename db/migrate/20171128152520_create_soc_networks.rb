class CreateSocNetworks < ActiveRecord::Migration[5.1]
  def change
    create_table :soc_networks do |t|
      t.string :title
      t.timestamps
    end
  end
end
