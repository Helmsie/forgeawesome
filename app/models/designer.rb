# == Schema Information
#
# Table name: designers
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  email      :string           not null
#  website    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Designer < ActiveRecord::Base
  has_many :icon_sets

DESIGNER_NAME = ["Dave Gandy"]

  validates :name, presence: true, inclusion: { in: DESIGNER_NAME }
  validates :email, presence: true, email: true, uniqueness: true

  def to_s
    name
  end
end
