class CategoriesController < ApplicationController
    before_action :require_admin, except: [:index, :show]
    
    def index
        @categories = Category.paginate(page: params[:page], per_page: 5)
    end #this part lists all the categories
    
    def new
        @category = Category.new
    end #this part refers to making a new category, the page itself
    
    def create
        @category = Category.new(category_params)
        if @category.save
            flash[:success] = "Category was created succesfully!"
            redirect_to categories_path
        else
            render 'new'
        end    
    end #this part is actually making/saving the category
    
    def show
      @category = Category.find(params[:id]) 
      @category_articles = @category.articles.paginate(page: params[:page], 
      per_page: 5)
    end #get category tags to show?
    
    private
    def category_params
        params.require(:category).permit(:name)
    end #this is what makes a category valid- it needs a name
    
    def require_admin
        if !logged_in? || (logged_in? and !current_user.admin?)
            flash[:danger] = "Only admins can perform that action."
            redirect_to categories_path
        end    
    end    
end    
