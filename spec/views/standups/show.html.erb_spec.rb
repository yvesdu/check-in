require 'rails_helper'

RSpec.describe "standups/show", type: :view do
  before(:each) do
    @standup = assign(:standup, Standup.create!(
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
  end
end
