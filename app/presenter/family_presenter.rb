class FamilyPresenter < ModelPresenter
  
  def full_name
    object.family_name + "" + object.given_name
  end

  def full_name_kana
    object.family_name_kana + "" + object.given_name_kana
  end


end
