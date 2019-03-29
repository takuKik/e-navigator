class Interview < ApplicationRecord
  belongs_to :user
  enum interview_status: { reserve: 0, approval: 1, disapproval: 2 }

  validate :datetime_cannot_be_in_the_past

  def datetime_cannot_be_in_the_past
    if interview_date.past?
      errors.add(:interview_datetime, "日時は現在以降の時間を設定してください。")
    end
  end
end
