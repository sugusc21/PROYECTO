json.array!(@mainprojects) do |mainproject|
  json.extract! mainproject, :id, :company, :name, :user_id
  json.url mainproject_url(mainproject, format: :json)
end
