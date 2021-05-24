json.array! @users do |user|
  json.id user.id
  json.name user.name
  json.nickname user.nickname
  json.points user.points
end
