require 'rails_helper'

RSpec.describe "klasses/new", :type => :view do
  before(:each) do
    assign(:klass, Klass.new(
      :name => "MyString"
    ))
  end

  it "renders new klass form" do
    render

    assert_select "form[action=?][method=?]", klasses_path, "post" do

      assert_select "input#klass_name[name=?]", "klass[name]"
    end
  end
end
