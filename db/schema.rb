ActiveRecord::Schema.define(:version => 20101012162534) do

  create_table "campaigns", :force => true do |t|
    t.text     "campaign"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "email"
    t.string   "address"
    t.string   "phone"
    t.string   "name"
    t.boolean  "display_name"
    t.boolean  "add_mailing_list"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",           :default => "pending"
    t.string   "current_state"
  end

  create_table "questions", :force => true do |t|
    t.text     "question"
    t.integer  "campaign_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "survey_responses", :force => true do |t|
    t.text     "response"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "voters", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "votes", :force => true do |t|
    t.integer  "voter_id"
    t.integer  "question_id"
    t.integer  "survey_response_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
end
