require File.dirname(__FILE__) + '/../spec_helper'

describe EditorsController do
  fixtures :all
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => Editor.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    Editor.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    @attr = { :name => "Bob", :bio => "Bob" }
    Editor.any_instance.stubs(:valid?).returns(true)
    post :create, :editor => @attr
    response.should redirect_to(editor_url(assigns[:editor]))
  end

  it "edit action should render edit template" do
    get :edit, :id => Editor.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    @attr = { :name => "", :bio => "" }
    Editor.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Editor.first, :editor => @attr
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    Editor.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Editor.first
    response.should redirect_to(editor_url(assigns[:editor]))
  end

  it "destroy action should destroy model and redirect to index action" do
    editor = Editor.first
    delete :destroy, :id => editor
    response.should redirect_to(editors_url)
    Editor.exists?(editor.id).should be_false
  end
end
