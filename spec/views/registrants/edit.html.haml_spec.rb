require 'spec_helper'

describe "registrants/edit.html.haml" do
  before(:each) do
    @registrant = assign(:registrant, stub_model(Registrant,
      :fname => "MyString",
      :lname => "MyString",
      :email => "MyString",
      :ancestor => "MyString",
      :conf_num => 1,
      :grand_total => "9.99",
      :payment_trustee => "MyString"
    ))
  end

  it "renders the edit registrant form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => registrant_path(@registrant), :method => "post" do
      assert_select "input#registrant_fname", :name => "registrant[fname]"
      assert_select "input#registrant_lname", :name => "registrant[lname]"
      assert_select "input#registrant_email", :name => "registrant[email]"
      assert_select "input#registrant_ancestor", :name => "registrant[ancestor]"
      assert_select "input#registrant_conf_num", :name => "registrant[conf_num]"
      assert_select "input#registrant_grand_total", :name => "registrant[grand_total]"
      assert_select "input#registrant_payment_trustee", :name => "registrant[payment_trustee]"
    end
  end
end
