class Message < ApplicationRecord
    belongs_to :user

    def duration_in_sec
        self.end_audio - self.start_audio
    end

end
