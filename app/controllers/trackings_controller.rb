class TrackingsController < ApplicationController
  before_action :set_provider, only: %i(index new create destroy)
  before_action :set_tracking, only: :destroy

  def index
    @trackings = @provider.trackings
  end

  def new
    @tracking = @provider.trackings.build
  end

  def create
    @tracking = Tracking.new(tracking_params)

    if @tracking.save
      redirect_to provider_trackings_path(@provider)
    else
      render :new
    end
  end

  def destroy
    @tracking.destroy
    redirect_to provider_trackings_path(@provider)
  end

  private

  def set_provider
    @provider = Provider.find(params[:provider_id])
  end

  def set_tracking
    @tracking = Tracking.find(params[:id])
  end

  def tracking_params
    params.require(:tracking).permit(:name)
  end
end
