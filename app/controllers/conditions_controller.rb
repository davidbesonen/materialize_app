class ConditionsController < ApplicationController
  def index
    @conditions = Condition.all
  end

  def new
    @condition = Condition.new
  end

  def create
    @condition = Condition.new(condition_params)
    if @condition.save
      flash[:notice] = "Condition was successfully created"
      redirect_to conditions_path # Index path
    else 
      # Validation fails, errors are attached to the object on the errors attribute
      # You can see this with a binding.pry, and then calling @condition.errors
      flash[:error] = "There was an error creating the condition"
      render :new
    end
  end

  def show
  end

  def destroy
  end

  def edit
  end

  def update
  end

  def condition_params
    params.require(:condition).permit(:name, :condition_group_id)
  end
end