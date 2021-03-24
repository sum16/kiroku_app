require "nkf"

module StringNormalizer
  extend ActiveSupport::Concern 

  #名前とカナを正規化
  def normalize_as_name(text)
    NKF.nkf("-W -w -Z1", text).strip if text
  end

  def normalize_as_furigana(text)
    NKF.nkf("-W -w -Z1 --katakana", text).strip if text
  end


end
