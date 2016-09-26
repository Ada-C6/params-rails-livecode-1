class PostsController < ApplicationController
  def index
    @welcome_msg = "Hola, amiga!"
    @posts = PostsController.allposts
  end

  def show
    @posts = PostsController.allposts
    @mypost = nil

    @posts.each do |post|
      number = params[:id].to_i #params gives you the url, params returns a string that we need to turn into an integer so we can use it
      if post[:id] == number
        @mypost = post
      end
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
      {id: 1, title: "My First Blog Post", author: "Dave Matthews", body: "Loren Ipsem"},

      {id: 2, title: "My Second Blog Post", author: "Dave Matthews", body: "This is the body."},

      {id: 3, title: "My Third Blog Post", author: "Dave Matthews", body: "This is where I will write some stuff."}
    ]
  end
end
