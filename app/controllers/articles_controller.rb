class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end
	def show
		@article = Article.find(params[:id])
	end

	def create
		@article = Article.new(article_params)
		if @article.save
			flash[:notice] = "Your article as been created successfully"
			redirect_to article_path(@article)
		else
			render 'new'
		end
		
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			flash[:notice] = "Your article as been updated successfully"
			redirect_to article_path(@article)
		else
			render 'edit'
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		flash[:notice] = "Your article as been deleted successfully"
		redirect_to articles_path
		
	end

private 
def article_params

	params.require(:article).permit(:title, :description)
end
end