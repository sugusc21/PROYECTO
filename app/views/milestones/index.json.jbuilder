json.array!(@milestones) do |milestone|
  json.extract! milestone, :id, :milestone, :type, :duedate, :mainprojects_id, :users_id
  json.url milestone_url(milestone, format: :json)
end
