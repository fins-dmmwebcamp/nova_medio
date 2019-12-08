class SearchController < ApplicationController
	def search
		@s_model= params[:modelday]
		case @s_model
		when "商品" then
			redirect_to admin_products_path(search: params[:search])
		when "アーティスト" then
			redirect_to admin_artists_path(search: params[:search])
		when "レーベル" then
			redirect_to admin_labels_path(search: params[:search])
		when "ジャンル" then
			redirect_to admin_genres_path(search: params[:search])
		when "ユーザー" then
			redirect_to admin_customers_path(search: params[:search])
	    end
	end

	def e_search
		@s_model = params[:modelday]
		case @s_model
		when "Product" then
			redirect_to products_path(search: params[:search], s_key: @s_model)
		when "Artist" then
			redirect_to products_path(search: params[:search], s_key: @s_model)
		when "Genre" then
			redirect_to products_path(search: params[:search], s_key: @s_model)
		when "Label" then
			redirect_to products_path(search: params[:search], s_key: @s_model)
		end
	end

end
