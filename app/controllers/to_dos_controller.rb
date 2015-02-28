class ToDosController < ApplicationController
  before_action :set_todo, only: [:edit, :show, :update, :destroy]

  def index
    @todos = ToDo.all
  end

  def show
  end

  def new
    @todo = ToDo.new
  end

  def edit
  end

  def update
    if @todo.update(todo_params)
      redirect_to @todo, notice: 'ToDo was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
  end

  def create
    @todo = ToDo.new(todo_params)
    if @todo.save
      redirect_to @todo, notice: 'ToDo was successfully created.'
    else
      render :new
    end
  end


  private

  def set_todo
    @todo = ToDo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:content, :due_on, :order, :complete)
  end

end
