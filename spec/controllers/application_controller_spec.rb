require "spec_helper"

describe ApplicationController do
  controller do
    before_action :authenticate!

    def index
      head :ok
    end
  end

  describe "#authenticate!" do
    let(:user) { FactoryGirl.create(:user) }

    it "halts with 401 if unauthorized" do
      get :index, format: "json"
      expect(response.status).to eq 401

      request.headers["X-TODO-Token"] = "#{user.username}:foo"
      get :index, format: "json"
      expect(response.status).to eq 401
    end

    it "passes the request through when authorized" do
      request.headers["X-TODO-Token"] = "#{user.username}:#{user.api_key}"
      get :index, format: "json"
      expect(response.status).to eq 200 # Success
    end
  end
end
