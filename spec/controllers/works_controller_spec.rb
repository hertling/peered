require File.dirname(__FILE__) + '/../spec_helper'

describe WorksController do
  fixtures :all
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => Work.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    Work.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Work.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(work_url(assigns[:work]))
  end

  it "edit action should render edit template" do
    get :edit, :id => Work.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    Work.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Work.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    Work.any_instance.stubs(:valid?).returns(true)
    w = Work.first
    put :update, :id => w.id, :author_id => w.author_id
    response.should redirect_to(work_url(assigns[:work]))
  end

  it "destroy action should destroy model and redirect to index action" do
    work = Work.first
    delete :destroy, :id => work
    response.should redirect_to(works_url)
    Work.exists?(work.id).should be_false
  end
end
