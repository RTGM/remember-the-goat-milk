class ToDosController < ApplicationController
  before_action :set_todo, only: [:edit, :show, :update, :destroy]

  def index
    #@todos = ToDo.all
    @todos = ToDo.rank(:row_order).all
  end

  def update_row_order
    @todo = ToDo.find(params[:todo][:todo_id])
    @todo.row_order_position = todo_params[:row_order_position]
    @todo.save

    render nothing: true # this is a POST action, updates sent via AJAX, no view rendered
  end

###ORDER IS A RESERVED WORD...FIX THAT
  def show
    redirect_to
  end

  def new
    @todo = ToDo.new
  end

  def edit
  end

  def update
    if @todo.update(todo_params)
      redirect_to root_path, notice: 'ToDo was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @todo.destroy
    redirect_to root_path, notice: 'ToDo was DESTROYED!!!'
  end

  def create
    @todo = ToDo.new(todo_params)
    if @todo.save
      redirect_to root_path, notice: 'ToDo was successfully created.'
    else
      render :new
    end
  end


  private

  def set_todo
    @todo = ToDo.find(params[:id])
  end

  def todo_params
    params.require(:to_do).permit(:content, :due_on, :row_order, :complete)
  end

end
