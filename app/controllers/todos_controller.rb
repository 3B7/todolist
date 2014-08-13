class TodosController < ApplicationController
  def index
    @todos=Todo.all
  end

  def new
    @todo = Todo.new
    authorize! :create, Todo, message: "You need to be a member to do that"
  end


  def create
    @todo = current_user.todos.build(todo_params)
    authorize! :create, @todo, message: "You need to be signed up to do that."
    @todo.save

    redirect_to @todo, notice: 'Your new TODO was saved.'
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def destroy
    @todo = Todo.find(params[:id])

    @todo.destroy
    redirect_to todos_path
  end

  private

  def todo_params
    params.require(:todo).permit(:description)
  end

end
