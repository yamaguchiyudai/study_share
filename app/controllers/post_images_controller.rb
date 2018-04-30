class PostImagesController < ApplicationController
	before_action :authenticate_user!, :except=>[:index, :show, :category_index]


	def new
		@post_image = PostImage.new
	end

	def create
		@post_image = PostImage.new(post_image_params)
	    @post_image.user_id = current_user.id

	    if @post_image.save
	    	redirect_to post_images_path
		else
			render :new
		end
	end

	def index
		@post_images = PostImage.page(params[:page]).reverse_order
	end

	def show
		@post_image = PostImage.find(params[:id])
		@post_comment = PostComment.new
	end

	def destroy
		@post_image = PostImage.find(params[:id])
		@post_image.destroy
		redirect_to post_images_path
	end

	def category_index_English
		@post_images = PostImage.where(category: 'English')
		@post_images = @post_images.page(params[:page]).reverse_order
	end
	def category_index_mathematics
		@post_images = PostImage.where(category: 'mathematics')
		@post_images = @post_images.page(params[:page]).reverse_order
	end
	def category_index_Japanese
		@post_images = PostImage.where(category: 'Japanese')
		@post_images = @post_images.page(params[:page]).reverse_order
	end
	def category_index_science
		@post_images = PostImage.where(category: 'science')
		@post_images = @post_images.page(params[:page]).reverse_order
	end
	def category_index_social_study
		@post_images = PostImage.where(category: 'social_study')
		@post_images = @post_images.page(params[:page]).reverse_order
	end






	def pay
	    Payjp.api_key = 'sk_test_39e59986f30cbf431385ec91'
	    charge = Payjp::Charge.create(
	    :amount => 3500,
	    :card => params['payjp-token'],
	    :currency => 'jpy',
		)
	end



	private
	def post_image_params
		params.require(:post_image).permit(:category, :image, :caption, :usr_id, :title)
	end

end
