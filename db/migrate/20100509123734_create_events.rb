class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.column :start_time, :datetime
      t.column :email, :string
      t.column :address, :string
      t.column :phone, :string
      t.column :name, :string
      t.column :display_name, :boolean
      t.column :add_mailing_list, :boolean
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
