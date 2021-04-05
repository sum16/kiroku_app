class FamilyMessage < Message
  #statusカラムの値がnewでdeletedカラムの値がfalseであるメッセージのみを抽出する
  scope :unprocessed, -> { where(status: "new", deleted: false) }
end
