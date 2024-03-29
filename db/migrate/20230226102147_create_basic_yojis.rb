class CreateBasicYojis < ActiveRecord::Migration[5.2]
  def change
    create_table :basic_yojis do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :first_kanji, foreign_key: { to_table: :kanjis }, null: false
      t.belongs_to :second_kanji, foreign_key: { to_table: :kanjis }, null: false
      t.belongs_to :third_kanji, foreign_key: { to_table: :kanjis }, null: false
      t.belongs_to :fourth_kanji, foreign_key: { to_table: :kanjis }, null: false
      t.timestamps
    end
  end
end
