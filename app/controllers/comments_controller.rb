class CommentsController < ApplicationController
  before_action :authenticate_user!
  after_action :sending_pusher, only: [:create]

  def create
    @comment = current_user.comments.build(comment_params)
    @blog = @comment.blog
    @notification = @comment.notifications.build recipient_id: @blog.user_id, sender_id: current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to blog_path(@blog), notice: 'コメントを投稿しました。' }
        format.json { render :show, status: :created, location: @comment }
        format.js { render :index }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
        format.js { render :error }
      end
    end
  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy

    respond_to do |format|
      format.js { render :index }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:blog_id, :content)
  end

  def sending_pusher
    Notification.sending_pusher(@notification.recipient_id)
  end
end
