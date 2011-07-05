class WorksController < ApplicationController
  def index
    @works = Work.all
  end

  def show
    @work = Work.find(params[:id])
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(params[:work])
    if @work.save
      redirect_to @work, :notice => "Successfully created work."
    else
      render :action => 'new'
    end
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id])
    if @work.update_attributes(params[:work])
      redirect_to @work, :notice  => "Successfully updated work."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @work = Work.find(params[:id])
    @work.destroy
    redirect_to works_url, :notice => "Successfully destroyed work."
  end
end
