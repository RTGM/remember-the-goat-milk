class ToDosController < ApplicationController
  before_action :set_to_do, only: [:edit, :show, :update, :destroy]

  def index
    #@todos = ToDo.all
    @to_dos = ToDo.rank(:row_order).all
  end

  def update_row_order
    @to_do = ToDo.find(params[:to_do][:to_do_id])
    @to_do.row_order_position = to_do_params[:row_order_position]
    @to_do.save

    render nothing: true # this is a POST action, updates sent via AJAX, no view rendered
  end

###ORDER IS A RESERVED WORD...FIX THAT
  def show
    redirect_to
  end

  def new
    @to_do = ToDo.new
  end

  def edit
  end

  def update
    if @to_do.update(to_do_params)
      redirect_to root_path, notice: 'ToDo was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @to_do.destroy
    redirect_to root_path, notice: 'ToDo was DESTROYED!!!'
  end

  def create
    @to_do = ToDo.new(to_do_params)
    if @to_do.save
      redirect_to root_path, notice: 'ToDo was successfully created.'
    else
      render :new
    end
  end


  private

  def set_to_do
    @to_do = ToDo.find(params[:id])
  end

  def to_do_params
    params.require(:to_do).permit(:content, :due_on, :row_order, :complete)
  end

end
