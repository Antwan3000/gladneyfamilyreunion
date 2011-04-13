require 'spec_helper'

describe "registrants/show.html.haml" do
  before(:each) do
    @registrant = assign(:registrant, stub_model(Registrant,
      :fname => "Fname",
      :lname => "Lname",
      :email => "Email",
      :ancestor => "Ancestor",
      :conf_num => 1,
      :grand_total => "9.99",
      :payment_trustee => "Payment Trustee"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Fname/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Lname/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Ancestor/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Payment Trustee/)
  end
end
