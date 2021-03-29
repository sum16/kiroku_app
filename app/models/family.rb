class Family < ApplicationRecord
  #belongs_to :care_recipitent
  has_many :vitals
  has_many :bathing_days
  has_many :intake_waters
  has_many :medicines
  has_many :excretas
  has_many :meals
  has_many :behavior_histories
  has_many :entries, dependent: :destroy
  has_many :events, through: :entries
  accepts_nested_attributes_for :vitals
  accepts_nested_attributes_for :bathing_days
  accepts_nested_attributes_for :intake_waters
  accepts_nested_attributes_for :medicines
  accepts_nested_attributes_for :excretas
  accepts_nested_attributes_for :meals
  accepts_nested_attributes_for :behavior_histories


  enum gender: { 男性: 0, 女性: 1 }
end
