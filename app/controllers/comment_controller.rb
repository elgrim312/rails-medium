class CommentController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]

  # GET /comment
  def index
    @comment = Comment.all

    render json: @comment.to_json(:include => { :user => { :only => :name } })
  end

  # GET /comment/1
  def show
    render json: @comment
  end

  # POST /comment
  def create
    @comment = Comment.new(comment_params.merge(user_id: current_user.id, article_id: params[:article_id]))

    if @comment.save
          render json: @comment.to_json(:include => { :user => { :only => :name } })

    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comment/1
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comment/1
  def destroy
    @comment.destroy
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def comment_params
    params.permit(:content, :article_id)
  end
end
