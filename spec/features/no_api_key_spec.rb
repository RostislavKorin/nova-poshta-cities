require "rails_helper"

RSpec.feature "Cities list", :type => :feature do
  background do
    stub_request(:post, "http://testapi.novaposhta.ua/v2.0/json/Address/getCities").
         with(:body => "[{\"modelName\":\"Address\",\"calledMethod\":\"getCities\",\"apiKey\":\"\"}]").
         to_return(:status => 200, :body => '[{"success":false}]', :headers => {})

  end
  scenario "No api key" do
    visit "/"
    fill_in "api_key", :with => ""
    click_button "Submit"
    expect(page).to have_text("Please enter your api key")
  end
end
