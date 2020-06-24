require 'faker'

100.times do |i|
  User.create(
    name:Faker::Name.name,
    email: "a"+i.to_s+"@a.com",
    password:'1234',
    password_confirmation:'1234',
    admin:false
  )
  print '.' if i%100==0
end
puts 
