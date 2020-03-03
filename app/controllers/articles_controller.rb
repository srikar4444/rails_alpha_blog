class ArticlesController < ApplicationController
    
    def index
        @articles = Article.all
    end


    def new 
        @article = Article.new
    end

    def edit 
        @article = Article.find(params[:id])
    end


    def create
        # render plain: params[:article].inspect
        @article = Article.new(article_params)
        # @article.save
        # redirect_to articles_show(@article)
        if @article.save
            # do something
            flash[:notice] = "Article is successfully created"
            redirect_to article_path(@article)
        else
            # do something
            render 'new'
        end

    end

    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:notice] = "Article is successfully updated"
            redirect_to article_path(@article)
        else
            render 'edit'
        end

    end


    def show
        @article = Article.find(params[:id])
    end



    private
        def article_params
            params.require(:article).permit(:title, :description)
        end


end
 