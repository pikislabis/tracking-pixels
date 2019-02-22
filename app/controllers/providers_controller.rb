class ProvidersController < ApplicationController
  before_action :set_provider, only: %i(edit update destroy)

  def index
    @providers = Provider.includes(:trackings).all
  end

  def new
    @provider = Provider.new
  end

  def create
    @provider = Provider.new(provider_params)

    if @provider.save
      redirect_to providers_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @provider.update(provider_params)
      redirect_to providers_path
    else
      render :edit
    end
  end

  def destroy
    @provider.destroy
    redirect_to providers_path
  end

  private

  def set_provider
    @provider = Provider.find(params[:id])
  end

  def provider_params
    params.require(:provider).permit(:name, :description)
  end
end
