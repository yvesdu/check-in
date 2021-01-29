class Team < ApplicationRecord
  belongs_to :account
  validates :account, presence: true
  validates :timezone, presence: true
  validates :name, presence: true

  has_many :team_memberships
  has_many :users, through: :team_memberships

  has_many :days, class_name: 'DaysOfTheWeekMembership', dependent: :delete_all
  accepts_nested_attributes_for :days
end