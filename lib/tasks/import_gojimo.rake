require 'rake'
require 'httparty'

namespace :import do
  desc 'Import data from Gojimo API'
  task :gojimo_data  => :environment do
    url = "https://api.gojimo.net/api/v4/qualifications"
    p "Start Import Data"
    response = HTTParty.get(url)
    p "No data from the API" if response.empty?
    Qualification.delete_all
    Country.delete_all
    response.each do |data|
      create_qualification(data)
    end
  end

  def create_assets(data)

  end

  def create_default_product(data)

  end

  def create_subject(data)

  end


  def create_qualification(data)
    qualification = Qualification.new()
    qualification.id   =  data["id"]
    qualification.name =  data["name"]
    qualification.link =  data["link"]
    qualification.id   =  data["id"] if qualification.id.nil?

    qualification.country_id = Country.find_or_create_by(code: data['country']['code'], name: data['country']['name'], link: data['country']['link']).id if not data['country'].nil?
    qualification.save
    print "."
  end
end