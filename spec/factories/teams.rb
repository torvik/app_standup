FactoryBot.define do
  factory :team do
    name "MyString"
    account nil
    timezone "MyString"
    has_reminder false
    has_recap false
    has_id "MyString"
    reminder_time "2018-02-26 17:45:55"
    recap_time "2018-02-26 17:45:55"
  end
end
