require 'rails_helper'
require 'spec_helper'

describe TasksController do

  describe "GET #index" do
    it "shows a table with all tasks in correct order" do
      task1 = Task.create(name: "task1", priority: "ważne", deadline: Date.tomorrow+1.day)
      task2 = Task.create(name: "task2", priority: "zwykłe", deadline: Date.tomorrow)
      get :index
      expect(assigns(:tasks).last).to eq(task1)
    end
    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #new" do
    it "shows a form to add new task" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    it "saves a correctly filled task into database" do
      params = { name: 'task1', priority: "ważne", deadline: Date.tomorrow }
      expect{post :create, params: { task: params }}.to change(Task, :count).by(1)
    end
    it "redirect to root if saved a task into database" do
      params = { name: 'task1', priority: "ważne", deadline: Date.tomorrow }
      post :create, params: { task: params }
      expect(response).to redirect_to root_url
    end
    it "renders action new if not saved a task into database" do
      params = { name: nil, priority: "ważne", deadline: Date.tomorrow }
      post :create, params: { task: params }
      expect(response).to render_template :new
    end
  end

  describe "DELETE #multi_delete" do
    it "destroys the pointed tasks" do
  
    end
  end

end
