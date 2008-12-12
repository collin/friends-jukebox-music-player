class Sources < Application

  def create source
    @source = Source.find_or_build_by_url source[:url]
    if (@source.new_record? ? @source.save : !@source.nil?)
      
      Merb.run_later do
        blog = Blog.find_or_build_by_url(@source.blog_url)
        unless blog.save
          Merb.logger.error "Bad Blog: #{blog.errors.inspect}"
        end
      end
      
      redirect resource(@source.track)
    else
      render :template => 'tracks/new'
    end
  end
  
end
