# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Generating seed data"

require 'open-uri'

# Use this as a template for delimited data sets
Industry.delete_all
open("#{Rails.root}/db/seed/industries.txt") do |industries|
  industries.read.each_line do |industry|
    naics_code, name = industry.chomp.split("|")
    Industry.create!(:name => name, :naics_code => naics_code)
  end
end

# Use this as a template for single vector data sets
Major.delete_all
open("#{Rails.root}/db/seed/majors.txt") do |majors|
  majors.read.each_line do |major|
    major = major.chomp
    Major.create!(:name => major)
  end
end

University.delete_all
open("#{Rails.root}/db/seed/universities.txt") do |universities|
  universities.read.each_line do |university|
    university = university.chomp
    University.create!(:name => university)
  end
end

puts "Data seeded"