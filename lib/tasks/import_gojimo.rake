require 'rake'
require 'httparty'

namespace :import do
  desc 'Import data from Gojimo API'
  task :gojimo_data  => :environment do
    url = "https://api.gojimo.net/api/v4/qualifications"
    byebug
    p "Start Import Data"
    response = HTTParty.get(url)
    p "No data from the API" if response.empty?
    response.each do |data|
      qualification = Qualification.new


    end
  end

  def create_assets

  end

  def create_default_product

  end

  def create_subject

  end

  def create_countries

  end

  def create_qualification

  end
end