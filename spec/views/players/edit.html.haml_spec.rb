require 'spec_helper'

describe "players/edit" do
  before(:each) do
    @player = assign(:player, stub_model(Player,
      :first_name => "MyString",
      :last_name => "MyString",
      :nickname => "MyString",
      :height => "9.99",
      :weight => "9.99"
    ))
  end

  it "renders the edit player form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", player_path(@player), "post" do
      assert_select "input#player_first_name[name=?]", "player[first_name]"
      assert_select "input#player_last_name[name=?]", "player[last_name]"
      assert_select "input#player_nickname[name=?]", "player[nickname]"
      assert_select "input#player_height[name=?]", "player[height]"
      assert_select "input#player_weight[name=?]", "player[weight]"
    end
  end
end
