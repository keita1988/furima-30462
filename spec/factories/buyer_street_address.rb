FactoryBot.define do
  factory :buyer_street_address do
    post_code         { '151-0062' }
    prefectures_id    { 2 }
    city              { '渋谷区' }
    address           { '青山１−１-１' }
    phone_number      { '09011112222' }
    token             {"tok_abcdefghijk00000000000000000"}
  end
end
