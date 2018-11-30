class RecoveryUserValidator < ActiveModel::Validator
  def validate(record)
    unless User.where('email = :eu or email_fallback = :eu or username = :eu', eu: record.email_or_username).exists?
      record.errors[:email_or_username] << "Sorry, we can't find a user with that username or email address"
    end
  end
end

class Recovery < ActiveRecord::Base

  include ActiveModel::Validations
  validates_with RecoveryUserValidator, on: :create

  include Tokenable

  attr_accessor :email_or_username
  belongs_to :user

  accepts_nested_attributes_for :user

  before_create :associate_user
  before_create { generate_token(:key) }

  def to_param
    key
  end

  def self.find_by_key key
    select('recoveries.user_id, recoveries.key').
    where(key: key).
    from(Recovery.order('id DESC').group(:user_id, :key, :id).limit(1).as('recoveries')).
    group([:user_id,:id,:key]).last
  end

private

  def associate_user
    self.user = User.where('email = :eu or email_fallback = :eu or username = :eu', eu: email_or_username).first
  end

end
