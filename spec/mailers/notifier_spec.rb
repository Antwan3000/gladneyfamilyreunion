require "spec_helper"

describe Notifier do
  describe "confirm_registration" do
    let(:mail) { Notifier.confirm_registration }

    it "renders the headers" do
      mail.subject.should eq("Confirm registration")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "confirm_modification" do
    let(:mail) { Notifier.confirm_modification }

    it "renders the headers" do
      mail.subject.should eq("Confirm modification")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
