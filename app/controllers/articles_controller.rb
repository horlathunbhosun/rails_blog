class ArticlesController < ApplicationController
		before_action :set_articles, only: [:show , :edit , :update , :destroy]


	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end
	def show
	end

	def create
		@article = Article.new(article_params)
		if @article.save
			flash[:success] = "Your article as been created successfully"
			redirect_to article_path(@article)
		else
			render 'new'
		end
		
	end

	def edit
	end

	def update
		if @article.update(article_params)
			flash[:success] = "Your article as been updated successfully"
			redirect_to article_path(@article)
		else
			render 'edit'
		end
	end

	def destroy
		@article.destroy
		flash[:danger] = "Your article as been deleted successfully"
		redirect_to articles_path
		
	end

 private
    # Use callbacks to share common setup or constraints between actions.
def set_articles
  @article = Article.find(params[:id])

end
	    # Never trust parameters from the scary internet, only allow the white list through.

def article_params

	params.require(:article).permit(:title, :description, :image)
end
end