class Caregiver::CustomerSearchForm
  include ActiveModel::Model 
  include StringNormalizer

  attr_accessor :family_name, :given_name, :family_name_kana, :given_name_kana, :gender


  def search

    normalize_values

    result = Customer

    if family_name_kana.present?
      result = result.where(family_name_kana: family_name_kana)
    end

    if given_name_kana.present?
      result = result.where(given_name_kana: given_name_kana)
    end

    result = result.where(gender: gender) if gender.present?
    result.order(:family_name_kana, :given_name_kana)
  end

  private def normalize_values
    self.family_name_kana = normalize_as_furigana(family_name_kana)
    self.given_name_kana = normalize_as_furigana(given_name_kana)
  end 

end
