class CommentsController < ApplicationController


	def index
		@id = params[:concert_id]
		@concert = Concert.find_by(id: @id)
		# binding.pry
		@comments = @concert.comments
		@band = @concert.band
	end

	def new
		@concert = Concert.find params[:concert_id]
		@comment = @concert.comments.new
	end

	def create
		@concert = Concert.find params[:concert_id]
		@comment = @concert.comments.new comment_params
		if @comment.save
			redirect_to concert_comments_path(@concert)
		else
			@errors = @comment.errors.full_messages
			render 'new'
		end
	end


	private
	def comment_params
		return params.require(:comment).permit(:comment)
	end

end
