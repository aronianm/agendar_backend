class TeamPlayer < ApplicationRecord
    belongs_to :team
    belongs_to :user


    delegate :formatted_name, to: :user
    delegate :email, to: :user
    delegate :phone_number, to: :user
    

    
end