# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name:'Brita', email:'brita@gmail.com', password:'password456', password_confirmation:'password456')
User.create(name:'Sarah', email:'sarah@gmail.com', password:'passwordsarah', password_confirmation:'passwordsarah')
User.create(name:'Jim', email:'jim@gmail.com', password:'passwordjim', password_confirmation:'passwordjim')