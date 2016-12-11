# == Schema Information
#
# Table name: icons
#
#  id          :integer          not null, primary key
#  icon_set_id :integer          not null
#  name        :string           not null
#  unicode     :integer          not null
#  svg         :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Icon < ActiveRecord::Base
  belongs_to :icon_set, inverse_of: :icons

  validates :icon_set_id, presence: true
  validates :name, presence: true, uniqueness: { scope: :icon_set_id }, format: { with: /\A[a-z0-9\-]+\Z/ }
  validates :unicode, presence: true, uniqueness: { scope: :icon_set_id }
end
