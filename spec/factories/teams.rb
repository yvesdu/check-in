FactoryBot.define do
  factory :team do
    name { "MyString" }
    account { nil }
    timezone { "MyString" }
    has_reminder { false }
    has_recap { false }
    reminder_time { "2021-01-28 22:36:46" }
    recap_time { "2021-01-28 22:36:46" }
  end
end
