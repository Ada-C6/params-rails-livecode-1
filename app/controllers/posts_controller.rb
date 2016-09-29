class PostsController < ApplicationController
  def index
    @welcome_msg = "Hola Amigo!"
    @posts = Post.all
  end

  def show
    @mypost = Post.find(params[:id].to_i)
  end

  def new
    @mypost = Post.new
  end

  def edit
    @posts = PostsController.allposts
    @mypost = nil

    @posts.each do |post|
      number = params[:id].to_i #This is a method that takes a parameter and returns it as a string

      if post[:id] == number
        @mypost = post
      end
    end
    if @mypost == nil
      @mypost ={id: params[:id].to_i, title: "Did not find", body: ""}
    end
  end

  def update
    show

    @mypost[:title] = params["post"]["title"]
    @mypost[:author] = params["post"]["author"]
    @mypost[:body] = params["post"]["body"]
  end

  def destroy
    @mypost = Post.destroy(params[:id].to_i)
  end

  def create
    @params = params
    @mypost = Post.new
    @mypost.title = params[:post][:title]
    @mypost.author = params[:post][:author]
    @mypost.body = params[:post][:body]

    @mypost.save
  end

  def self.allposts
    [
      {id: 1, title: "My first blog post", author: "Dave Mathews", body: "Loren Ipsum"},

      {id: 2, title: "My second blog post", author: "Dave
      Mathews Jr.", body: "another Loren Ipsum"},

      {id: 3, title: "My third blog post", author: "Dave Mathews III - aka 'Trey'", body: "one more Loren Ipsum"},
    ]
  end

  private
  def user_params
    # This is the command that gets the information from a form with post name and gets the permitted parameters to allow (security so hackers don't put in extra ruby code)
    params.require(:posts).permit(:title, :author, :body)
  end


end
