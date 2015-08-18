# == Schema Information
#
# Table name: assets
#
#  id                 :string(255)
#  copyright          :string(255)
#  meta               :string(255)
#  size               :integer
#  path               :string(255)
#  unzipped_base_url  :string(255)
#  info               :hstore
#  link               :string(255)
#  default_product_id :integer
#  created_at         :datetime
#  updated_at         :datetime
#

class Asset < ActiveRecord::Base
  belongs_to :default_product
end
