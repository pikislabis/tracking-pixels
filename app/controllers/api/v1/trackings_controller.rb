module Api
  module V1
    class TrackingsController < Api::V1::BaseController
      before_action :set_provider

      def create
        tracking = @provider.trackings.build(tracking_params)

        if tracking.save
          render json: tracking, status: :ok
        else
          render json: { error: { code: 422, message: tracking.errors } }, status: :unprocessable_entity
        end
      end

      private

      def set_provider
        @provider = Provider.find(params[:provider_id])
      end

      def tracking_params
        params.permit(:name)
      end

    end
  end
end
