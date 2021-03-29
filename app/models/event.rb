class Event < ApplicationRecord
  has_many :entries, dependent: :restrict_with_exception
  has_many :applicants, through: :entries, source: :family
  belongs_to :registrant, class_name: "Caregiver"

  attribute :application_start_date, :date, default: Date.today
  attribute :application_start_hour, :integer, default: 9
  attribute :application_start_minute, :integer, default: 0
  attribute :application_end_date, :date, default: Date.today
  attribute :application_end_hour, :integer, default: 17
  attribute :application_end_minute, :integer, default: 0

  def init_visual_attributes
    if application_start_time
      self.application_start_date = application_start_time.to_date
      self.application_start_hour = application_start_time.hour
      self.application_start_minute = application_start_time.min
    end

    if application_end_time
      self.application_end_date = application_end_time.to_date
      self.application_end_hour = application_end_time.hour
      self.application_end_minute = application_end_time.min
    end
  end
  
  #イベントへの申し込みがあるときにfalse、ないときにtrueを返す
  def deletable? 
    entries.empty?
  end


  before_validation :set_application_start_time
  before_validation :set_application_end_time

  #フォームの日付、時間、分の文字列をDateTimeオブジェクトへ変換、start_time、end_time属性にセットする処理
  private def set_application_start_time
    if t = application_start_date&.in_time_zone
      self.application_start_time = t.advance(
        hours: application_start_hour,
        minutes: application_start_minute
      )
    end
  end

  private def set_application_end_time
    if t = application_end_date&.in_time_zone
      self.application_end_time = t.advance(
        hours: application_end_hour,
        minutes: application_end_minute
      )
    end
  end

  validates :title, presence: true, length: { maximum: 32 }
  validates :description, presence: true, length: { maximum: 800 }
  validates :application_start_time, date: {
    after_or_equal_to: Time.zone.local(2000, 1, 1),
    before: -> (obj) { 1.year.from_now },
    allow_blank: true
  }
  validates :application_end_time, date: {
    after: :application_start_time,
    before: -> (obj) { obj.application_start_time.advance(days: 90) },
    allow_blank: true,
    if: -> (obj)  { obj.application_start_time }
  }
  validate do
    if min_number_of_participants && max_number_of_participants && 
      min_number_of_participants > max_number_of_participants
      errors.add(:max_number_of_participants, :less_than_min_number)
    end
  end
  
    #family/eventsコントローラー
    scope :published, -> {
      where("application_start_time <= ?", Time.current).order(application_start_time: :desc)
    }
  
end
