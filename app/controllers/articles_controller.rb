class ArticlesController<ApplicationController
    def show
        @art=Article.find(params[:id])
    end 
    def index
        @arts=Article.all
    end

    def new
    end

    def create
        @a=Article.new(params.require(:article).permit(:title,:description))
        @a.save
        render plain: @a.errors.full_messages
    end

end
