class TopicsController < ApplicationController
	before_action :find_topic, only: [:edit, :update, :destroy]
	def index
		@topics = Topic.all
	end

	def new
		@topic = Topic.new
	end

	def create
		@topic = Topic.new(title: params[:topic][:title])

		if @topic.save
			flash[:success] = "Topic Created"
			redirect_to topics_path
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @topic.update_attributes(title: params[:topic][:title])
			flash[:success] = "Topic Updated"
			redirect_to topics_path
		else
			render :edit
		end
	end

	def destroy
		@topic.destroy
		flash[:success] = "Topic Deleted"
		redirect_to topics_path
	end

	private

	def find_topic
		@topic = Topic.where(id: params[:id]).first
		unless @topic
			flash[:error] = "Topic doesn't exist"
			redirect_to topics_path
		end
	end
end
