class Qualification < ActiveRecord::Base
  has_one :country
  has_many :subjects
  has_one :default_product

end
