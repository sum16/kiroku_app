class Message < ApplicationRecord
  belongs_to :family
  belongs_to :caregiver, optional: true
  belongs_to :root, class_name: "Message", foreign_key: "root_id", optional: true
  belongs_to :parent, class_name: "Message", foreign_key: "parent_id", optional: true
  has_many :children, class_name: "Message", foreign_key: "parent_id", dependent: :destroy

  #Messageオブジェクトのバリデーションが実行される直前に実行する
  before_validation do
    if parent
      self.family = parent.family
      self.root = parent.root || parent
    end
  end

  validates :subject, presence: true, length: { maximum: 80 }
  validates :body, presence: true, length: { maximum: 800 }

scope :not_deleted, -> { where(deleted: false) }
scope :deleted, -> { where(deleted: true) }
scope :sorted, -> { order(created_at: :desc) }


end
