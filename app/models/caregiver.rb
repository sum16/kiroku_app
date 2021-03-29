class Caregiver < ApplicationRecord
  has_secure_password
  has_many :care_recipitents
  has_many :events, foreign_key: "registrant_id", dependent: :restrict_with_exception

  attr_accessor :remember_me 

 
 
  #自動ログイン
  def remember_me?
    remember_me == "1"
  end
end
