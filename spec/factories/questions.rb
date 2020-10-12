FactoryBot.define do
  factory :question do
    number { 1 }
    sentence { 'sample question' }
    hint_1 { 'sample hint' }
    answer { 'sample answer' }
    commentary { 'sample commentary' }
  end
end