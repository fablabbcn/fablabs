class Project < ActiveRecord::Base
  include Authority::UserAbilities
  include Authority::Abilities
  include RocketPants::Cacheable

  self.authorizer_name = 'ProjectAuthorizer'

  has_many :images, dependent: :destroy
  accepts_attachments_for :images, attachment: :file, append: true

  belongs_to :lab
  belongs_to :owner, class_name: 'User'

  has_many :contributions, dependent: :destroy
  has_many :contributors, through: :contributions
  accepts_nested_attributes_for :contributions

  has_many :collaborations, dependent: :destroy
  has_many :collaborators, through: :collaborations
  accepts_nested_attributes_for :collaborations

  has_many :machineries, dependent: :destroy
  has_many :devices, through: :machineries
  accepts_nested_attributes_for :machineries

  def self.last_updated_at
    self.select(:updated_at).order('updated_at DESC').first
  end

end
