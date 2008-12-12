class Blogs < Application
  def index
    @blogs = Blog.all
    render
  end

  def show id
    render
  end
  
  def create blog
    @blog = Blog.new blog
    if @blog.valid?
      Merb.run_later do
        unless @blog.save
          Merb.logger.error "Bad Blog: #{blog.errors.inspect}"
        end
      end
      redirect url(:me)
    else
      render :template => 'blogs/new'
    end
  end
end
