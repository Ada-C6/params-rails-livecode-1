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
      {id: 1, title: "My first blog post", author: "Dave Mathews", body: "Loren Ipsum"},

      {id: 2, title: "My second blog post", author: "Dave
      Mathews Jr.", body: "another Loren Ipsum"},

      {id: 3, title: "My third blog post", author: "Dave Mathews III - aka 'Trey'", body: "one more Loren Ipsum"},
    ]
  end

end
