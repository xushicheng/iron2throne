class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]

  def index
    @microposts = Micropost.all
  end

  def show
    @micropost = Micropost.find(params[:id])
    @video_iframe = @micropost.video_iframe
  end

  def new
    @micropost = current_user.microposts.build
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "视频分享成功啦!"
      @video_url = @micropost.video_title(params[:micropost][:url])
      redirect_to current_user
    else
      render 'microposts/new'
    end
  end




  private
    def micropost_params
      params.require(:micropost).permit(:url, :title, :content)
    end
end
