class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
    @works = @author.works
  end

  def new
    @author = Author.new(:user_id => current_user)
  end

  def create
    @author = current_user.authors.new(params[:author])
    if @author.save
      redirect_to root_path, :notice => "Successfully created author."
    else
      render :action => 'new'
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    if @author.update_attributes(params[:author])
      redirect_to @author, :notice  => "Successfully updated author."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    redirect_to authors_url, :notice => "Successfully destroyed author."
  end
end
