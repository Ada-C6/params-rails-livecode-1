class PostsController < ApplicationController
  def index
    @welcome_msg = "Hola Amigo!"
    @posts = PostsController.allposts
  end

  def create
    @params = params
    @title = params["title"]
    @author = params["author"]
    @body = params["body"]
  end

  def show
    @posts = PostsController.allposts
    @mypost = nil

    @posts.each do |post|
      number = params[:id].to_i
      if post[:id] == number
        @mypost = post
      end
    end

    if @mypost == nil
      @mypost = {id: params[:id].to_i, title: "Did not find", body: "" }
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

  def self.allposts
    [
      {id: 1, title: "My first blog post", author: "Dave Matthews", body: "Loren Ipsem"},

      {id: 2, title: "My second blog post", author: "Dave Matthews", body: "This is body"},

      {id: 3, title: "My third blog post", author: "Dave Matthews", body: "Seattle, home sweet home."}
    ]
  end

  private
  def user_params
    params.require(:post).permit(:title, :author, :body)
  end


end
