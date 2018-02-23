require 'rails_helper'

RSpec.describe "standups/edit", type: :view do
  before(:each) do
    @standup = assign(:standup, Standup.create!(
      :user => nil,
      :hash_id => "MyString"
    ))
  end

  it "renders the edit standup form" do
    render

    assert_select "form[action=?][method=?]", standup_path(@standup), "post" do

      assert_select "input#standup_user_id[name=?]", "standup[user_id]"

      assert_select "input#standup_hash_id[name=?]", "standup[hash_id]"
    end
  end
end
