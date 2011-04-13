require 'spec_helper'

describe "registrants/index.html.haml" do
  before(:each) do
    assign(:registrants, [
      stub_model(Registrant,
        :fname => "Fname",
        :lname => "Lname",
        :email => "Email",
        :ancestor => "Ancestor",
        :conf_num => 1,
        :grand_total => "9.99",
        :payment_trustee => "Payment Trustee"
      ),
      stub_model(Registrant,
        :fname => "Fname",
        :lname => "Lname",
        :email => "Email",
        :ancestor => "Ancestor",
        :conf_num => 1,
        :grand_total => "9.99",
        :payment_trustee => "Payment Trustee"
      )
    ])
  end

  it "renders a list of registrants" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Fname".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Lname".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Ancestor".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Payment Trustee".to_s, :count => 2
  end
end
