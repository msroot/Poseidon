class PostController < ApplicationController

  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find params[:id]
  end
  
  def create
    post = Post.create params[:post] 

    if post.save  
      redirect_to :controller => "post", :action => "show", :id => post.id  
    else
      redirect_to :controller => "post", :action => "new"
    end
    
  end
  
  def edit
    @post = Post.find(params[:id]) 
  end
  
  def destroy
    Post.find(params[:id]).destroy
    redirect_to :controller => "post", :action => "index"
  end
  
  
  def update
    post  = Post.find(params[:id])
    if post.update(params[:post])
      redirect_to :controller => "post", :action => "show", :id => post.id  
    else
      redirect_to :controller => "post", :action => "edit"
    end
  end
  
  
  def new
    @post = Post.new
  end
  
end
