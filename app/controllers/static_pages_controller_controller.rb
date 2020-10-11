class StaticPagesControllerController < ApplicationController
  require 'flickr'

  #before_action :authenticate
  
  # def index
  #   flickr = Flickr.new ENV["FLICKR_KEY"], ENV["FLICKR_SECRET"]
  # end

  # def authenticate
  #   flickr = Flickr.new ENV["FLICKR_KEY"], ENV["FLICKR_SECRET"]
  #   token = flickr.get_request_token
  #   auth_url = flickr.get_authorize_url(token['oauth_token'], :perms => 'delete')

  #   puts "Open this url in your browser to complete the authentication process: #{auth_url}"
  #   puts "Copy here the number given when you complete the process."
  #   verify = gets.strip

  #   begin
  #     flickr.get_access_token(token['oauth_token'], token['oauth_token_secret'], verify)
  #     login = flickr.test.login
  #     puts "You are now authenticated as #{login.username} with token #{flickr.access_token} and secret #{flickr.access_secret}"
  #   rescue Flickr::FailedResponse => e
  #     puts "Authentication failed : #{e.msg}"
  #   end
  # end

  def index
    if params[:user_id]
      flickr = Flickr.new ENV["FLICKR_KEY"], ENV["FLICKR_SECRET"]
      @photos = flickr.photos.search(user_id: params[:user_id])
      @user_info = flickr.people.getInfo(user_id: params[:user_id])
    end

    if params[:newest_photo]
      flickr = Flickr.new ENV["FLICKR_KEY"], ENV["FLICKR_SECRET"]
      @photo = flickr.photos.getRecent.photo.first
    end

    if params[:user_info]
      flickr = Flickr.new ENV["FLICKR_KEY"], ENV["FLICKR_SECRET"]
      @user_info = flickr.people.getInfo(user_id: params[:user_info])
    end

    if params[:random_user]
      flickr = Flickr.new ENV["FLICKR_KEY"], ENV["FLICKR_SECRET"]
      @random_user = flickr.photos.getRecent.photo.sample.owner
    end
  end
end

