# == Schema Information
#
# Table name: default_products
#
#  id               :string(255)
#  title            :string(255)
#  link             :string(255)
#  qualification_id :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class DefaultProduct < ActiveRecord::Base
  self.primary_key = 'id'

  has_many :assets
  belongs_to :qualification
end
