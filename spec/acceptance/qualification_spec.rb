require "spec_helper"

feature "Qualification" do

  background do
    @qua = create_valid_qualification(name: 'SAT')
  end

  scenario "visit index" do

    visit root_path
    #save_and_open_page
    page.should have_css('.qualification td', text: 'SAT')
  end

end