require "spec_helper"

describe TasksController do
  let(:user) { FactoryGirl.create(:user) }

  before do
    request.headers["X-TODO-Token"] = "#{user.username}:#{user.api_key}"
  end

  describe "#index" do
    let!(:tasks) { FactoryGirl.create_list(:task, 1, user: user) }

    it "returns tasks" do
      get :index, format: "json"
      expect(response.body).to eq tasks.to_json
    end
  end

  describe "#create" do
    let(:task_params) { FactoryGirl.attributes_for(:task) }

    it "creates the task" do
      post :create, task: task_params, format: "json"
      expect(user).to have(1).tasks
    end

    it "returns the created task" do
      post :create, task: task_params, format: "json"
      expect(response.body).to eq user.tasks.first.to_json
    end
  end

  describe "#update" do
    let!(:task) { FactoryGirl.create(:task, user: user) }

    it "updates the task" do
      patch :update, id: task.id, task: {content: "Another task"}, format: "json"
      expect(user.tasks.first.content).to eq "Another task"
    end

    it "scopes to the current user" do
      task.update_attributes(user_id: nil)
      begin
        patch :update, id: task.id, task: {content: "Another task"}, format: "json"
        fail
      rescue => error
        expect(error).to be_a(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe "#destroy" do
    let!(:task) { FactoryGirl.create(:task, user: user) }

    it "deletes the task" do
      delete :destroy, id: task.id, format: "json"
      expect(user).to have(0).tasks
    end

    it "scopes to the current user" do
      task.update_attributes(user_id: nil)
      begin
        delete :destroy, id: task.id, format: "json"
        fail
      rescue => error
        expect(error).to be_a(ActiveRecord::RecordNotFound)
      end
    end
  end
end
