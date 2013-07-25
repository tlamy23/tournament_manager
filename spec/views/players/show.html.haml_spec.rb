require 'spec_helper'

describe "players/show" do
  before(:each) do
    @player = assign(:player, stub_model(Player,
      :first_name => "First Name",
      :last_name => "Last Name",
      :nickname => "Nickname",
      :height => "9.99",
      :weight => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Nickname/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
  end
end
