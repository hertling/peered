class WorksController < ApplicationController
  def index
    @author = Author.find(params[:author_id])
    @works = @author.works
  end

  def show
    @author = Author.find(params[:author_id])
    @work = @author.works.find(params[:id])
  end

  def new
    @author = Author.find(params[:author_id])
    @work = @author.works.build
  end

  def create
    @author = Author.find(params[:author_id])
    @work = @author.works.build(params[:work])
    if @work.save
      redirect_to [@author, @work], :notice => "Successfully created work."
    else
      render :action => 'new'
    end
  end

  def edit
    @author = Author.find(params[:author_id])
    @work = @author.works.find(params[:id])
  end

  def update
    @author = Author.find(params[:author_id])
    @work = @author.works.find(params[:id])
    if @work.update_attributes(params[:work])
      redirect_to [@author, @work], :notice  => "Successfully updated work."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @author = Author.find(params[:author_id])
    @work = @author.works.find(params[:id])
    @work.destroy
    redirect_to author_works_path(@author), :notice => "Successfully destroyed work."
  end
end
