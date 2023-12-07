json.array! @teams do |team|
    json.id team.id
    json.name team.name
    json.players team.team_players do |player|
        json.extract! player, :id, :email, :phone_number, :formatted_name
    end
end