class ConditionsController < ApplicationController
  def index
    @conditions = Condition.all
  end

  def new
    @condition = Condition.new
    @condition_groups = ConditionGroup.all
  end

  def create
    @condition = Condition.new(condition_params)
    if @condition.save
      flash[:notice] = "Condition was successfully created"
      redirect_to conditions_path # Index path
    else 
      # Validation fails, errors are attached to the object on the errors attribute
      # You can see this with a binding.pry, and then calling @condition.errors
      flash[:alert] = "There was an error creating the condition"
      render :new
    end
  end

  def show
  end

  def destroy
    @condition = Condition.find(params[:id])
    @condition.destroy
    flash[:notice] = "The to-do item was successfully destroyed."
    redirect_to conditions_path
  end

  def edit
    @condition = Condition.find(params[:id])
    @condition_groups = ConditionGroup.all
  end

  def update
  end

  def condition_params
    params.require(:condition).permit(:name, :condition_group_id)
  end
end