class CreateLoginRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :login_records do |t|
      t.references :caregiver, null: false, index: false, foreign_key: true #スタッフレコードへの外部キー
      t.string :type, null: false #ログのタイプ

      t.datetime :created_at, null: false
    end
  end
end
