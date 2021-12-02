FactoryBot.define do
  factory :meeting do
    title { "MyString" }
    description { "MyString" }
    start_time { "2021-12-01 09:36:37" }
    end_time { "2021-12-01 09:36:37" }
    start_date { "2021-12-01" }
    end_date { "2021-12-01" }
    recurring_type { 1 }
    is_recurring { false }
    meeting_room_id { 1 }
  end
end
