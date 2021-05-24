# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'time'

User.destroy_all
Message.destroy_all
WeekPoint.destroy_all

data_json = JSON.parse(File.read('db/bot-test.json'))['messages']

data_json.each do |message|
  unless User.exists?(nickname: message['author']['nickname'])
    user = User.create!(
      name: message['author']['name'],
      nickname: message['author']['nickname'],
      discord_id: message['author']['id'],
      accumulated_points: 0
    )
    puts "#{user.id} - #{user.nickname} - User Created"
    puts '--------------------------------------------'
  end

  week_point = WeekPoint.create!(
    week: Time.zone.now,
    user: User.find_by(discord_id: message['author']['id']),
    points: 0
  )

  puts "#{week_point.id} - Week Point Created"
  puts '--------------------------------------------'

  image_link_filter = message['attachments']&.first['url'] unless message['attachments']&.first.nil?
  message = Message.create!(
    content: message['content'] || '',
    user: User.find_by(discord_id: message['author']['id']),
    discord_user_id: message['author']['id'],
    time_sent: Time.zone.parse(message['timestamp']),
    image_link: image_link_filter
  )

  week_point.add_points_if_not_capped(message.content)
  week_point.save!
  puts "#{message.id} - Message Created"
  puts '--------------------------------------------'
end
