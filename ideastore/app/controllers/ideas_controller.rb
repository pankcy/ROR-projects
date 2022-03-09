# app/controller/ideas_controller.rb
class IdeasController < ApplicationController
  def show
    @idea = Idea.find(params[:id])
  end

  def index
    @ideas = Idea.all
  end

  def new
  end

  def create
    @idea = Idea.new(idea_params)

    if @idea.save
      redirect_to @idea
    else
      render "new"
    end
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])

    if @idea.update(idea_params)
      redirect_to @idea
    else
      render "edit"
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy

    redirect_to ideas_path
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description)
  end
end
