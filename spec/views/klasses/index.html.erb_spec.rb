require 'rails_helper'

RSpec.describe "klasses/index", :type => :view do
  before(:each) do
    assign(:klasses, [
      Klass.create!(
        :name => "Name"
      ),
      Klass.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of klasses" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
