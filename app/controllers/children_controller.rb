class ChildrenController < ApplicationController

  def index
    @children = Child.where(parent_id: params[:user_id])
  end

  def new
    @child = Child.new
  end

  def create
    @child = Child.new(child_params)
    if @child.save && authorized(@child.parent)
        flash[:notice] = "#{@child.name} has been successfully added"
        redirect_to user_children_path(@child.parent_id)
      else
        @errors = @child.errors
        redirect_to new_user_child_path(@child.parent)
      end
  end

  def show
    @child = Child.find(params[:id])
  end

  def edit
    @child = Child.find(params[:id])
  end

  def update
    @child = Child.find(params[:id])
    if @child.save && authorized?(@child.parent)
      flash[:notice] = 'Your changes have been saved'
      @child.assign_attributes(child_params)
      redirect_to user_children_path(@child.parent_id)
    else
      @errors = @child.errors
      redirect_to edit_user_child_path(@child.id)
    end
  end

  def destroy
    @child = Child.find(params[:id])
    if @child.save && authorized(@child.parent)
      @child.destroy
    else
      flash[:notice] = 'Restricted access'
    end
      redirect_to user_children_path(@child.parent_id)
  end

private
  def child_params
    params.require(:child).permit(:name, :parent_id, :allergies, :birthday)
  end

end
