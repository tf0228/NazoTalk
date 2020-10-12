FactoryBot.define do
  factory :user do
    name { 'sample_user' }
    email { 'sample@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end