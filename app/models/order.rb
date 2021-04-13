class Order < ApplicationRecord
  enum status: {prepare: 0, processing: 1, done: 2}

  belongs_to :user

  before_save :send_email, if: :will_save_change_to_status?

  scope :with_status, -> (status) { where(status: status) }
  scope :with_user_email, -> (user_email) {
    from(joins(:user).where('users.email = ?', user_email), :orders)
  }

  class << self
    def query_filter(filters)
      return all if filters.blank?

      filters.select { |_, v| v.present? }.reduce(all) do |relation, (filter, value)|
        case filter.to_s
        when 'user_email'
          relation.with_user_email(value)
        when 'status'
          relation.with_status(value)
        else
          relation
        end
      end
    end
  end

  private

  def send_email
  end
end

