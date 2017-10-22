class ArticlesController < ApplicationController
    def index
        # grab all the articles in the DB
        @articles = Article.all
    end
    
    def new
        @article = Article.new
    end
    
    def edit
        @article = Article.find(params[:id])
    end
    
    
    def create
        #render plain: params[:article].inspect
        @article = Article.new(article_params)
        if @article.save
            flash[:notice] = "Article was successfully created"
            redirect_to article_path(@article)
        else
            render 'new'
        end
            
    end
    
    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:notice] = "Article was sucessfully updated"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end
    
    
    def show
        @article = Article.find(params[:id])
    end
    
    # for whitelisting the new articles
    private
        def article_params
           params.require(:article).permit(:title, :description) 
        end
end