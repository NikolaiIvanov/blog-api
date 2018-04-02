module V1
  class PostsController < ApplicationController
    before_action :set_post, only: [:show, :update, :destroy]

    def index
      @posts = current_user.posts.as_json(include: :comments)
      json_response(@posts)
    end

    def show
      json_response(@post.as_json(include: :comments))
    end

    def create
      @post = current_user.posts.create!(post_params)
      json_response(@post, :created)
    end

    def update
      @post.update(post_params)
      head :no_content
    end

    def destroy
      @post.destroy
      head :no_content
    end

    private
    def post_params
      params.permit(:id,
                    :title,
                    :body,
                    :published,
                    :created_by)
    end

    def set_post
      @post = Post.find(params[:id])
    end
  end
end
