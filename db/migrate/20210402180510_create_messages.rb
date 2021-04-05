class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|

      t.references :family, null:false
      t.references :caregiver, null:false
      t.integer :root_id  #Messageの外部キー
      t.integer :parent_id #Messageの外部キー
      t.string :type, null:false #継承カラム
      t.string :status, null:false, default: "new" #状態(職員向け)
      t.string :subject, null:false
      t.text :body 
      t.text :remarks #備考
      t.boolean :discarded, null: false, default: false #ユーザー(家族)側の削除フラグ
      t.boolean :deleted, null: false, default: false #職員側の削除フラグ

      t.timestamps

    end
  end
end
