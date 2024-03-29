class SlotYoji < ApplicationRecord
  SHOW_VIEW_ALLOW_RELATION = %w[Meaning Sample Comment].map(&:freeze).freeze

  include Sampleable
  # has_many :samples, as: :sampleable
  include Bookmarkable
  # has_many :bookmarks, as: :bookmarkable
  belongs_to :user

  has_many :meanings
  has_many :comments

  belongs_to :first_kanji, class_name: 'Kanji', foreign_key: 'first_kanji_id'
  belongs_to :second_kanji, class_name: 'Kanji', foreign_key: 'second_kanji_id'
  belongs_to :third_kanji, class_name: 'Kanji', foreign_key: 'third_kanji_id'
  belongs_to :fourth_kanji, class_name: 'Kanji', foreign_key: 'fourth_kanji_id'

  scope :used_with, ->(args_kanji) {
    result = where(first_kanji: args_kanji).or(where(second_kanji: args_kanji)).or(where(third_kanji: args_kanji)).or(where(fourth_kanji: args_kanji))
    merge(result)
    # 結果を他のスコープ結果にmergeする感じ
  }
end
