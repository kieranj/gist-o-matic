class GistsController < ApplicationController
  
  before_action :authenticate, except: [ :index, :show ]
  
  def index
    @user  = User.find(params[:user_id]) 
    @gists = @user == current_user ? @user.gists : @user.gists.visible
    @gists = @gists.decorate
  end
  
  def show
    @gist = Gist.from_param(params[:id]).decorate
    raise ActiveRecord::RecordNotFound unless @gist.visible? || @gist.owner?(current_user)
  end
  
  def new
    @gist = Gist.new
  end
  
  def create
    @gist = current_user.gists.build(gist_params)
    
    if @gist.save
      redirect_to user_gists_path(current_user), notice: 'Gist saved successfully'
    else
      render action: :new
    end
  end
  
  def edit
    @gist = current_user.gists.from_param(params[:id])
    
    render action: :new
  end
  
  def update
    @gist = current_user.gists.from_param(params[:id])
    if @gist.update(gist_params)
      redirect_to user_gists_path(current_user), notice: 'Gist updated successfully'
    else
      render action: :edit
    end
  end

  def destroy
    gist = current_user.gists.from_param(params[:id])
    gist.destroy

    redirect_to :back
  end
  
  protected
  
    def gist_params
      params.require(:gist).permit(:name, :code, :language, :visible)
    end
    
end
