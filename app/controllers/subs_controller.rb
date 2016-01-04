class SubsController < ApplicationController
  before_action :require_user!, only: [:new, :create]

  def index
    @subs = Sub.all
    render :index
  end

  def new
    render :new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.mod_id = current_user.id

    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def show
    @sub = Sub.find(params[:id]) #may be wrong...
    render :show
  end

  def edit
    @sub = current_user.subs.find(params[:id])
    render :edit
  end

  def update
    @sub = current_user.subs.find(params[:id])

    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def destroy
    @sub = current_user.subs.find(params[:id])
    @sub.destroy
    redirect_to subs_url
  end

  private
  def sub_params
    params.require(:sub).permit(:title, :description)
  end

end
