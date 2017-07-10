class ChannelsController < ApplicationController
  before_action :set_channel, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
    @channels = Channel.paginate(page: params[:page], per_page: 5)
  end

  def show
  end

  def new
    @channel = Channel.new
  end

  def edit
  end

  def create
    @channel = Channel.new(channel_params)

    if @channel.save
      flash[:success] = "La chaine a été ajoutée avec succès."
      redirect_to @channel
    else
      render :new
    end
  end

  def update
    if @channel.update(channel_params)
      flash[:success] = "La chaine a été modifiée avec succès."
      redirect_to @channel
    else
      render :edit
    end
  end

  def destroy
    @channel.destroy
    flash[:danger] = "La chaine a été supprimée avec succès."
    redirect_to channels_url
  end

  private

  def set_channel
    @channel = Channel.find(params[:id])
  end

  def channel_params
    params.require(:channel).permit(:name)
  end
end
