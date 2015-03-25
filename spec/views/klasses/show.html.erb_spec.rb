require 'rails_helper'

RSpec.describe "klasses/show", :type => :view do
  before(:each) do
    @klass = assign(:klass, Klass.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
