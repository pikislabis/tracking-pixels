module Api
  module V1
    class TrackingsController < Api::V1::BaseController
      before_action :set_provider, only: :create
      before_action :set_tracking, only: :convert

      def create
        tracking = @provider.trackings.build(tracking_params)

        if tracking.save
          render json: tracking, status: :ok
        else
          render json: { error: { code: 422, message: tracking.errors } }, status: :unprocessable_entity
        end
      end

      def convert
        if @tracking.update(validated: true)
          render json: @tracking, status: :ok
        else
          render json: { error: { code: 422, message: tracking.errors } }, status: :unprocessable_entity
        end
      end

      private

      def set_provider
        @provider = Provider.find(params[:provider_id])
      end

      def set_tracking
        @tracking = Tracking.find_by(code: params[:code])
      end

      def tracking_params
        params.permit(:name)
      end
    end
  end
end
