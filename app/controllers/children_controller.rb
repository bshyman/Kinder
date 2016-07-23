class ChildrenController < ApplicationController

  def index
    @children = Child.where(parent_id: params[:user_id])
  end

  def new
    @child = Child.new
  end

  def create
    @child = Child.new(child_params)
    if @child.save && authorized?(@child.parent)
        flash[:notice] = "#{@child.name} has been successfully added"
        redirect_to user_children_path(@child.parent.id)
      else
        @errors = @child.errors
        redirect_to new_user_child_path(child_params[:parent_id])
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
    if @child && authorized?(@child.parent)
      @child.assign_attributes(child_params)
        if @child.save
          flash[:notice] = 'Your changes have been saved'
          redirect_to user_child_path(@child.parent.id,@child.id)
        else
          flash[:notice] = 'Name cannot be blank'
          render 'edit'
        end
    else
      redirect_to no_access_path
    end
  end

  def destroy
    @child = Child.find(params[:id])
    if @child.save && authorized?(@child.parent)
      @child.destroy
    else
      flash[:notice] = 'Restricted access'
    end
      redirect_to user_path(@child.parent_id)
  end

private
  def child_params
    params.require(:child).permit(:name, :allergies, :birthday).merge(parent_id: current_user.id)
  end

end
