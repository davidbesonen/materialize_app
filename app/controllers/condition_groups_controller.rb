class ConditionGroupsController < ApplicationController
  def index 
    @condition_groups = ConditionGroup.all
    # @condiiton_group = ConditionGroup.new
  end

  def new
    # has a view
    @condiiton_group = ConditionGroup.new
  end

  def show
    # has a view
  end

  def create 
  end

  def destroy
  end

  def edit
    # has a view
  end

  def update
  end
end