class PostsController < ApplicationController
  def index
    @welcome_msg = "Hola Amigo!"
    @posts = PostsController.allposts
  end

  def show
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

  def new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def create
    @params = params
    @title = params["title"]
    @author = params['author']
    @body = params['body']
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
