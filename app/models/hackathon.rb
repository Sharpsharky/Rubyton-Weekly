class Hackathon < ApplicationRecord
    has_many :entries
    
    def self.create_from_next_hackathon_name
        next_hackathon_name = HackathonName.order(:created_at).first

        return unless next_hackathon_name

        start_date = DateTime.current
        end_date = start_date + 7.days
        
        Hackathon.create(
            title: next_hackathon_name.name,
            start_date: start_date,
            end_date: end_date

        )

    next_hackathon_name.destroy
    end
end
