class MicropostsController < ApplicationController

  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
    begin
      @micropost = Micropost.create(user_id: current_user.id, content: params[:micropost][:content], picture: params[:micropost][:picture])
      flash[:success] = "Micropost created!"
      redirect_to root_url
    rescue Exception => e
      puts e.backtrace
      @feed_items = []
      redirect_to :back
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end

private

    def micropost_params
      params.require(:micropost).permit(:content, :picture)
    end


    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end

end
