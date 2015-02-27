class ToDosController < ApplicationController

  def new
    @todo = ToDo.new
  end

  def create
    
  end

  def index
    @todos = ToDo.all
  end

end
