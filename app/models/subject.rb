# == Schema Information
#
# Table name: subjects
#
#  id               :string(255)
#  title            :string(255)
#  link             :string(255)
#  colour           :string(255)
#  qualification_id :integer
#

class Subject < ActiveRecord::Base
  has_many :qualification
end
