require 'rails_helper'

RSpec.describe "standups/new", type: :view do
  before(:each) do
    assign(:standup, Standup.new(
      :user => nil,
      :hash_id => "MyString"
    ))
  end

  it "renders new standup form" do
    render

    assert_select "form[action=?][method=?]", standups_path, "post" do

      assert_select "input#standup_user_id[name=?]", "standup[user_id]"

      assert_select "input#standup_hash_id[name=?]", "standup[hash_id]"
    end
  end
end
