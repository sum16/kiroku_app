class AlertCustomer1 < ActiveRecord::Migration[6.0]
  def change
    add_index :customers ,:family_name
    add_index :customers ,:given_name
    add_index :customers ,[ :family_name, :given_name ]
    add_index :customers ,:family_name_kana
    add_index :customers ,:given_name_kana
    #長いのでnameオプションを使用する
    add_index :customers ,[ :family_name_kana, :given_name_kana ], name: "index_customers_on_furigana"
  end
end
