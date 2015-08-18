class Qualification < ActiveRecord::Base
  has_one :country
  has_many :subjects

end
