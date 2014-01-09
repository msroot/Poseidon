##  Poseidon
Poseidon is a very simple example rack application that help you to understand how to build your own rack applications with middlewares based MVC pattern and Active record

### Create a Migration:
    rake db:new_migration name=Posts


### Edit migration:
    class Posts < ActiveRecord::Migration
    	  def up
	        create_table :posts do |t|
	          t.string :title
	          t.string :body
	          t.timestamps
	      end
    end


### Create a Model:
models/post.rb

    class Post < ActiveRecord::Base
    end

### Create a Controller:
controllers/post_controller.rb

    class PostController < ApplicationController
      def index
        @posts = Post.all
      end
    end

### Create a view:
view/post/show.rb

    <% @posts.each do |p| %>
     <li><%= p.title %></li>
    <% end %>

### Create and migrate the database:
    
    rake db:setup

### Start Console:
    
    ./console.sh

###Create a post
    
    Post.create title: "works?"
    {
                :id => 1,
             :title => "works?",
              :body => nil,
        :created_at => 2013-12-12 15:32:26 UTC,
        :updated_at => 2013-12-12 15:32:26 UTC
    }


### Start the server:
    rackup

### Visit localhost:

    localhost:8080/post/

### Create new:

    localhost:8080/post/new