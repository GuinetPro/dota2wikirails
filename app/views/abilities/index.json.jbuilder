json.habilidades @habilidades do |skill|
  json.id skill.id
  json.name skill.name
  json.description skill.description
  json.image_url skill.image.url
  json.thumb_url skill.image.url(:mini)
end
