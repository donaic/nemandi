require 'rails_helper'

RSpec.describe "klasses/edit", :type => :view do
  before(:each) do
    @klass = assign(:klass, Klass.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit klass form" do
    render

    assert_select "form[action=?][method=?]", klass_path(@klass), "post" do

      assert_select "input#klass_name[name=?]", "klass[name]"
    end
  end
end
