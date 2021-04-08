class BehaviorHistory < ApplicationRecord
  belongs_to :family


  with_options presence: true do
    validates :behavior_history_date
    validates :action_record
    validates :behavior_time
  end

end
