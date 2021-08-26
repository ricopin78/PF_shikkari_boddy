FactoryBot.define do
  factory :user do
    email                 { "sample@gmail.com" }
    encrypted_password    { "1234567" }
    last_name             { "山田" }
    last_name_kana        { "ヤマダ" }
    first_name            { "太郎" }
    first_name_kana       { "タロウ" }
    company               { "株式会社しっかりBoddy" }
    profile_image         { [Rack::Test::UploadedFile.new(Rails.root.join('app/assets/images/test.png'), 'app/assets/images/test.png')] }
  end
end
