class TaskGroupsController < ApplicationController

	def index
		@task_groups = current_user.task_groups
		@task_group_new = TaskGroup.new
		@tasks = Task.all
	end

	def create
		@task_group_new = TaskGroup.new(task_group_params)
		@task_group_new.user_id = current_user.id
		if @task_group_new.save
			redirect_to task_groups_path
		else
			render 'index'
		end
	end

	def show
		@task_group = TaskGroup.find(params[:id])
		@task_groups = TaskGroup.where.not(id: @task_group.id)
		@tasks = @task_group.tasks
		@task_new = Task.new
	end

	def update
		@task_group = TaskGroup.find(params[:id])
		if @task_group.update(task_group_params)
			redirect_to task_groups_path
		else
			render 'index'
		end
	end

	def destroy
		@task_group = TaskGroup.find(params[:id])
		if params[:status] == '3'
			@tasks = @task_group.tasks.where(status: 3)
			@tasks.destroy_all
			redirect_to task_group_path(@task_group.id)
		  	flash[:notice] = "削除されました"
		else
			@task_group.destroy
			redirect_to task_groups_path
			flash[:notice] = "削除されました"
		end
	end

	private

	def task_group_params
		params.require(:task_group).permit(:title, :content, :user_id)
	end
end
