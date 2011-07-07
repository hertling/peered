require File.dirname(__FILE__) + '/../spec_helper'

describe WorksController do
  fixtures :all
  render_views

  before(:each) do
    @author = Factory(:author)
  end

  it "index action should render index template" do
    get :index, :author_id => @author
    response.should render_template(:index)
  end

  describe "GET 'show'" do
    before(:each) do
      @work = Factory(:work)
      @work.author = @author
      @work.save
    end
    it "show action should render show template" do
      get :show, :id => @work, :author_id => @author
      response.should render_template(:show)
    end
  end
  it "new action should render new template" do
    get :new, :author_id => @author
    response.should render_template(:new)
  end

  describe "POST 'create'" do
    describe "failure" do
      before(:each) do
        @attr = { :name => "", :content => "" }
      end

      it "should not create a work" do
        lambda do
          post :create, :author_id => @author, :work => @attr
        end.should_not change(Work, :count)
      end

      it "should render new template" do
        post :create, :author_id => @author, :work => @attr
        response.should render_template(:new)
      end
    end

    describe "success" do
      before(:each) do
        @attr = { :name => "Magnum Opus X", 
                  :content => "It was another dark and stormy night..." }
      end

      it "should create a work" do
        lambda do
          post :create, :author_id => @author, :work => @attr
        end.should change(Work, :count).by(1)
      end


      it "should redirect to show page" do
        post :create, :author_id => @author, :work => @attr
        response.should redirect_to(author_work_path(@author, assigns[:work]))
      end

    end
  end

  describe "GET 'edit'" do
    before(:each) do
      @work = Factory(:work)
      @work.author = @author
      @work.save
    end

    it "should render edit template" do
      get :edit, :id => @work, :author_id => @author
      response.should render_template(:edit)
    end
  end

  describe "PUT 'update'" do
    before(:each) do
      @work = Factory(:work)
      @work.author = @author
      @work.save
    end

    describe "failure" do
      before(:each) do
        @attr = { :name => "", :content => "" }
      end
    
      it "should render edit template" do
        put :update, :id => @work, :author_id => @author, :work => @attr
        response.should render_template(:edit)
      end
    end

    describe "success" do
      before(:each) do
        @attr = { :name => "Magnum Opus X",
                  :content => "It was a sunny and clear day..." }
      end

      it "should redirect to show page" do
        put :update, :id => @work, :author_id => @author, :work => @attr
        response.should redirect_to(author_work_path(@author, @work))
      end
    end
  end

  it "destroy action should destroy model and redirect to index action" do
    work = Factory(:work)
    work.author = @author
    work.save
    delete :destroy, :id => work, :author_id => @author
    response.should redirect_to(author_works_path(@author))
    Work.exists?(work.id).should be_false
  end
end
