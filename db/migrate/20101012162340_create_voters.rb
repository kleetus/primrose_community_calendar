class CreateVoters < ActiveRecord::Migration
  def self.up
    create_table :voters do |t|
      t.column :name, :string
      t.column :address, :string
      t.column :phone, :string
      t.column :email, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :voters
  end
end
