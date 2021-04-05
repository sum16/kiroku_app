class LoginRecord < ApplicationRecord
  self.inheritance_column = nil #typeカラムを普通のカラムとして使用
  belongs_to :caregiver, foreign_key: "caregiver_id"

  DESCRIPTION = {
    logged_in: "ログイン",
    logged_out: "ログアウト",
    rejected: "ログイン拒否"
  }

  #to_symメソッドでシンボルに変換
  def description 
    DESCRIPTION[type.to_sym]
  end

end
