require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  describe 'GET index' do
    it 'assigns @tasks and orders tasks descending byd deadline (more urgent task the first)' do
      task1 = Task.create(name: 'task1', priority: 'important', deadline: Date.today)
      task2 = Task.create(name: 'task2', priority: 'common', deadline: Date.tomorrow)
      get :index
      expect(assigns(:tasks)).to eq([task1, task2])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET new' do
    it 'assigns @task with the new empty task object' do
      get :new
      expect(assigns(:task)).not_to be_nil
      expect(assigns(:task).name).to be_nil
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe 'POST create' do
    it 'assigns the @task' do
      post :create, params: { task: { name: 'task1', priority: 'important', deadline: Date.tomorrow } }
      expect(assigns(:task)).not_to be_nil
      expect(assigns(:task).priority).to eq 'important'
    end

    context 'with valid data' do
      before(:each) do
        post :create, params: { task: { name: 'task1', priority: 'important', deadline: Date.tomorrow } }
      end

      it 'saves the @task' do
        expect(assigns(:task).save).to be true
      end

      it 'redirectes user to the root_path' do
        expect(response).to redirect_to(root_path)
      end
    end

    context 'with invalid data' do
      before(:each) do
        post :create, params: { task: { name: 'task1', priority: nil, deadline: Date.tomorrow } }
      end

      it 'doesn\'t save the @task' do
        expect(assigns(:task).save).to be false
      end

      it 'assigns flash[:notice]' do
        expect(flash[:notice]).to eq('All fields are required. Try again')
      end

      it 'renders the new template' do
        expect(response).to render_template('new')
      end
    end
  end

  describe 'DELETE multi_delete' do
    before(:each) do
      post :create, params: { task: { name: 'task1', priority: 'important', deadline: Date.tomorrow } }
      post :create, params: { task: { name: 'task2', priority: 'important', deadline: Date.tomorrow } }
    end

    it 'destroys a tasks with name inserted in params[:tasks] hash' do
      before = Task.count
      delete :multi_delete, params: { tasks: Task.last.id }
      after = Task.count
      expect(after - before).to eq(-1)
    end

    it 'redirectes user to the root_path' do
      delete :multi_delete, params: { tasks: Task.last.id }
      expect(response).to redirect_to(root_path)
    end
  end

  # private
  #
  # def task_params
  #   params.require(:task).permit(:name, :priority, :deadline)
  # end
end
