# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :string
#  published  :boolean
#  created_by :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :post do
    title { Faker::HitchhikersGuideToTheGalaxy.specie  }
    body { Faker::Hipster.paragraph }
    created_by { Faker::Name.name }
    published true
  end
end
