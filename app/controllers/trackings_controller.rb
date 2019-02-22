class TrackingsController < ApplicationController
  before_action :set_provider, only: %i(index destroy)
  before_action :set_tracking, only: :destroy

  def index
    @trackings = @provider.trackings
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
end
