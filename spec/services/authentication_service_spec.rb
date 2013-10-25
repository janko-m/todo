require "spec_helper"

describe AuthenticationService do
  let(:it) { described_class }
  let!(:user) { FactoryGirl.create(:user) }

  describe ".authenticate_from_session" do
    it "returns nil when the user wasn't found" do
      session = double(username: "foo", password: "bar")
      expect(it.authenticate_from_session(session)).to be_nil
    end

    it "returns false when the user was found, but password wasn't correct" do
      session = double(username: user.username, password: "bar")
      expect(it.authenticate_from_session(session)).to be_false
    end

    it "returns the user when the user was found and authenticated" do
      session = double(username: user.username, password: user.password)
      expect(it.authenticate_from_session(session)).to eq user
    end
  end

  describe ".authenticate_from_headers" do
    it "doesn't blow up when the header value is nil" do
      headers = nil
      expect(it.authenticate_from_headers(headers)).to be_nil
    end

    it "doesn't blow up when the header is of invalid format" do
      headers = "..."
    end

    it "returns nil when the user wasn't found" do
      headers = "foo:bar"
      expect(it.authenticate_from_headers(headers)).to be_nil
    end

    it "returns false when the user was found, but password wasn't correct" do
      headers = "#{user.username}:bar"
      expect(it.authenticate_from_headers(headers)).to be_false
    end

    it "returns the user when the user was found and authenticated" do
      headers = "#{user.username}:#{user.api_key}"
      expect(it.authenticate_from_headers(headers)).to eq user
    end
  end
end
