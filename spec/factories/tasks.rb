FactoryBot.define do
  factory :task do
    type { "todo" }
    title { "MyString" }
    is_completed { false }
  end
end
