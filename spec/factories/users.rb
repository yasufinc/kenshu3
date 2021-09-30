FactoryBot.define do
  factory :user do
    email                 { 'yasu.matsumoto@finc.com' }
    password              { 'password' }
    password_confirmation { 'password' }
    name                  { 'yasu' }
    admin_flg             { true }
  end
end
