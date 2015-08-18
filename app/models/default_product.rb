class DefaultProduct < ActiveRecord::Base
  has_many :assets
  belongs_to :qualification
end
