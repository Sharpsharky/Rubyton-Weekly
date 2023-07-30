module ApplicationHelper
    def current_hackathon
        @current_hackathon ||= Hackathon.order(:start_date).last
    end

    def time_remaining_in_words(end_time)
        time_diff = (end_time - Time.current).to_i
    
        days = time_diff / 1.day
        time_diff -= days * 1.day
    
        hours = time_diff / 1.hour
        time_diff -= hours * 1.hour
    
        minutes = time_diff / 1.minute
    
        formatted_time = ""
        formatted_time += "#{days} days " if days.positive?
        formatted_time += "#{hours} hours " if hours.positive?
        formatted_time += "#{minutes} minutes" if minutes.positive?
        formatted_time.strip
      end

end
