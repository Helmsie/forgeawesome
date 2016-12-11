# == Schema Information
#
# Table name: icon_sets
#
#  id              :integer          not null, primary key
#  user_id         :integer          not null
#  designer_id     :integer          not null
#  name            :string           not null
#  slug            :string           not null
#  designed_for    :integer          not null
#  css_prefix      :string           not null
#  icon_css_prefix :string           not null
#  website         :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class IconSet < ActiveRecord::Base
  belongs_to :user, inverse_of: :icon_sets
  belongs_to :designer, inverse_of: :icon_sets

  has_many :icons

  DESIGN_SIZE = [14, 16, 18, 21, 24, 28, 30, 32, 36, 48, 64]

  validates :user_id, presence: true
  validates :designer_id, presence: true
  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :slug, presence: true, uniqueness: { scope: :user_id }, format: { with: /\A[a-z0-9\-]+\Z/ }
  validates :designed_for, presence: true, inclusion: { in: DESIGN_SIZE }
  validates :css_prefix, presence: true, format: { with: /\A[a-z0-9\-]+\Z/ }
  validates :icon_css_prefix, presence: true, format: { with: /\A[a-z0-9\-]+\Z/ }
end
