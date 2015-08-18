# == Schema Information
#
# Table name: qualifications
#
#  id         :string(255)
#  name       :string(255)
#  link       :string(255)
#  country_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Qualification < ActiveRecord::Base
  has_one :country
  has_many :subjects
  has_one :default_product

end
