require File.dirname(__FILE__) + '/../spec_helper'

describe AuthorsController do
  fixtures :all
  render_views

  describe "GET 'index'" do
    it "index action should render index template" do
      get :index
      response.should render_template(:index)
    end
  end

  describe "GET 'show'" do
    before(:each) do
      @author = Factory(:author)
    end

    it "show action should render show template" do
      get :show, :id => @author
      response.should render_template(:show)
    end
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  describe "POST 'create'" do
    before(:each) do
      user = Factory(:user)
      test_sign_in user
    end
    describe "failure" do
      before(:each) do
        @attr = { :name => " ", :bio => " ", :author_id => 0 }
      end

      it "should not create an author" do
        lambda do
          post :create, :author => @attr
        end.should_not change(Author, :count)
      end

      it "should render new template" do
        post :create, :author => @attr
        response.should render_template(:new)
      end
    end

    describe "success" do
      before(:each) do
        @attr = { :name => "Bob", :bio => "Bob" }
      end
      
      it "should create a user" do
        lambda do
          post :create, :author => @attr
        end.should change(Author, :count).by(1)
      end

      it "should redirect to show page" do
        post :create, :author => @attr
        response.should redirect_to(root_path)
      end
    end
  end

  it "edit action should render edit template" do
    get :edit, :id => Author.first
    response.should render_template(:edit)
  end

  describe "PUT 'update'" do

    before(:each) do
      @author = Factory(:author)
    end

    describe "failure" do
      before(:each) do
        @attr = { :name => " ", :bio => "" }
      end

      it "update action should render edit template when model is invalid" do
        put :update, :id => @author, :author => @attr
        response.should render_template(:edit)
      end
    end

    describe "success" do
      before(:each) do
        @attr = { :name => "Bob", :bio => "Bob" }
      end

      it "update action should redirect when model is valid" do
        put :update, :id => @author, :author => @attr
        response.should redirect_to(author_url(@author))
      end
    end
  end

  it "destroy action should destroy model and redirect to index action" do
    author = Author.first
    delete :destroy, :id => author
    response.should redirect_to(authors_url)
    Author.exists?(author.id).should be_false
  end
end
