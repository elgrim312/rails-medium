class ArticlesController < ApplicationController 
  include ActionController::MimeResponds
  before_action :set_article, only: [:show, :update, :destroy]

  # GET /articles
  def index
    @articles = Article.all
    respond_to do |format|
      format.json do
        render :json => @articles.to_json(:include => { :user => { :only => :name } })
      end
    end
  end

  # GET /articles/1
  def show
    render json: @article
  end

  # POST /articles
  def create
    @article = Article.new(article_params.merge(user_id: current_user.id))

    if @article.save
      respond_to do |format|
        format.json do
          render :json => @article.to_json(:include => { :user => { :only => :name } })
        end
      end
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
  end

  # GET /articles/:id/comments
  def get_comments
    render json: @article.comments
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def article_params
      params.require(:article).permit(:title, :description, :body)
    end

    def as_json(options = {})
    super(options.merge(include: :user))
  end
end
