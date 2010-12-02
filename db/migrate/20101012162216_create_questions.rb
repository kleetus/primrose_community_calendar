class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.column :question, :text
      t.column :campaign_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
