require "rails_helper"

RSpec.feature "Cities list", :type => :feature do
  background do
    stub_request(:post, "http://testapi.novaposhta.ua/v2.0/json/Address/getCities").
         with(:body => "[{\"modelName\":\"Address\",\"calledMethod\":\"getCities\",\"apiKey\":\"CORRECT_API_KEY\"}]").
         to_return(:status => 200, :body => '[{"success":true, "data":[]}]', :headers => {})

  end
  scenario "User lists cities" do
    visit "/"
    fill_in "api_key", :with => "CORRECT_API_KEY"
    click_button "Submit"
    expect(page).to have_text("Cities where Nova Poshta work")
  end
end
