

module FactoryHelpers

  def new_valid_qualification(attrs = {})
    attrs.reverse_merge!(
      id: Faker::Company.duns_number,
      name: Faker::Name.name,
      link: Faker::Internet.url
    )
    Qualification.new(attrs)
  end

  def create_valid_qualification(attrs = {})
    qua = new_valid_qualification(attrs)
    qua.save!
    qua
  end

end

RSpec.configuration.include FactoryHelpers #, type: [:request, :models]
