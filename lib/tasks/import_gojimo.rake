require 'rake'
require 'httparty'

namespace :import do
  desc 'Import data from Gojimo API'
  task :gojimo_data  => :environment do
    url = "https://api.gojimo.net/api/v4/qualifications"
    p "Start Import Data"
    response = HTTParty.get(url)
    p "No data from the API" if response.empty?

    clean_database

    response.each do |data|
      create_qualification(data)
    end
  end

  def create_assets(data, id)
    p "Insert default product"
    data.each do |asset|
      asst = Asset.new(id: asset['id'], copyright: asset['copyright'] , meta: asset['meta'], size: asset['size'],
                          path: asset['path'], unzipped_base_url: asset['unzipped_base_url'] ,info: asset['info'], link: asset['link'] ,default_product_id: id )
      asst.id = asset['id'] if asst.id.nil?
      asst.save
      print '+'
    end
  end

  def create_default_product(data, id)
    p "Insert default product"
    data.each do |def_prod|
      default_product = DefaultProduct.new(id: def_prod['id'], title: def_prod['title'], link: def_prod['link'],qualification_id: id)
      default_product.id = def_prod['id'] if default_product.id.nil?
      default_product.save
      create_assets(def_prod['assets'], default_product.id) if not def_prod['assets'].empty?
    end
  end

  def create_subject(data, id)
    p "Insert subjects"
    data.each do |subject|
      sub =Subject.new(id:subject['id'], title: subject['title'], link: subject['link'], colour: subject['colour'], qualification_id: id)
      sub.id = subject['id'] if sub.id.nil?
      sub.save
      print "*"
    end
  end


  def create_qualification(data)
    qualification = Qualification.new()
    qualification.id   =  data["id"]
    qualification.name =  data["name"]
    qualification.link =  data["link"]
    qualification.id   =  data["id"] if qualification.id.nil?

    qualification.country_id = Country.find_or_create_by(code: data['country']['code'], name: data['country']['name'], link: data['country']['link']).id if not data['country'].nil?
    qualification.save
    create_subject(data['subjects'], qualification.id)                 if not data['subjects'].empty?
    create_default_product(data['default_products'], qualification.id) if not data['default_products'].empty?
    print "."
  end

  def clean_database
    Qualification.delete_all
    Country.delete_all
    Subject.delete_all
    DefaultProduct.delete_all
    Asset.delete_all
  end
end