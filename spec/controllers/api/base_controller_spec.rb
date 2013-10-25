require "spec_helper"

describe Api::BaseController do
  let!(:user) { FactoryGirl.create(:user) }

  controller(described_class) do
    def index
      head :ok
    end
  end

  it "logs in the user before every request" do
    get :index, format: "json"
    expect(controller.send(:logged_in?)).to be_false

    request.headers["X-TODO-Token"] = "#{user.username}:#{user.api_key}"
    get :index, format: "json"
    expect(controller.send(:logged_in?)).to be_true
  end
end
