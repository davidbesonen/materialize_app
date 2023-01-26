# any calls to render or redirect instantly terminate the method (think of it like a return statement)

class ConditionGroupsController < ApplicationController
  # before_action :set_condition_group, only: [:show, :edit, :update, :destroy]

  def index 
    @condition_groups = ConditionGroup.all
    # @condiiton_group = ConditionGroup.new
  end

  # This renders the HTML form for creating a new condition_group
  def new
    # has a view
    @condition_group = ConditionGroup.new
  end
  
  # This method is the paired method to the new method
  # Create is responsible for receiving the data from the form we rendered in the new method
  def create
    @condition_group = ConditionGroup.new(condition_group_params)
    if @condition_group.save
      flash[:notice] = "Condition Group was successfully created"
      redirect_to condition_groups_path # Index path
    else 
      # Validation fails, errors are attached to the object on the errors attribute
      # You can see this with a binding.pry, and then calling @condition_group.errors
      flash[:error] = "There was an error creating the condition group"
      render :new
    end
  end

  def show
    # has a view, this is the least important method and the only one James doesn't care if you finish or use
    @condition_group = ConditionGroup.find(params[:id])
  end


  def destroy
    @condition_group = ConditionGroup.find(params[:id])
    @condition_group.destroy
    flash[:success] = "The to-do item was successfully destroyed."
    redirect_to condition_groups_path
  end

  def edit
    @condition_group = ConditionGroup.find(params[:id])
    
    # has a view
  end

  def update
    @condition_group = ConditionGroup.find(params[:id])
    if @condition_group.update(condition_group_params)
      flash[:notice] = "Condition Group was successfully updated"
      redirect_to condition_groups_path # Index path
    else 
      # Validation fails, errors are attached to the object on the errors attribute
      # You can see this with a binding.pry, and then calling @condition_group.errors
      flash[:error] = "There was an error updating the condition group"
      render :new
    end
  end

  # When accepting parameters from the front-end, we need to whitelist them
  def condition_group_params
    params.require(:condition_group).permit(:name)
  end

end