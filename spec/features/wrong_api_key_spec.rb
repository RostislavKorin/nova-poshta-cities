require "rails_helper"

RSpec.feature "Cities list", :type => :feature do
  background do
    stub_request(:post, "http://testapi.novaposhta.ua/v2.0/json/Address/getCities").
         with(:body => "[{\"modelName\":\"Address\",\"calledMethod\":\"getCities\",\"apiKey\":\"WRONG_API_KEY\"}]").
         to_return(:status => 200, :body => '[{"success":false}]', :headers => {})

  end
  scenario "Wrong api key" do
    visit "/"
    fill_in "api_key", :with => "WRONG_API_KEY"
    click_button "Submit"
    expect(page).to have_text("Wrong api key")
  end
end
