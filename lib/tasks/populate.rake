namespace :db do
  task :populate => :environment do
    require 'populator'
    require 'faker'

    User.delete_all

    User.populate 100 do |user|
      user.first_name = Faker::Name.name.split(" ").first
      user.last_name = Faker::Name.name.split(" ").last
      user.email   = Faker::Internet.email
      user.password_digest = "foobar"
      user.remember_token = "foobar"
      user.university = University.all.shuffle.first.name
      user.industry = Industry.all.shuffle.first.name
      user.major = Major.all.shuffle.first.name
      user.location    = "#{Faker::Address.city}, #{Faker::Address.state_abbr}"
    end
  end
end