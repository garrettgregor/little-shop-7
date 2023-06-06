class Admin::MerchantsController < ApplicationController
  def index
    @merchants = Merchant.all
  end

  def show
    @merchant = Merchant.find(params[:id])
  end

  def edit
    @merchant = Merchant.find(params[:id])
  end

  def update
    @merchant = Merchant.find(params[:id])
    @merchant.update(merchant_params)
    redirect_to(admin_merchant_path(@merchant))
    flash[:info] = "Merchant Information Updated"
    ## Might want to use this for a future story
    # if params[:status] == "disabled"
    # elsif params[:status] == "enabled"
    #   @merchant.update(name: params[:name], status: (1 if params[:status] == "enabled"))
    #   redirect_to(admin_merchant_path(@merchant))
    #   flash[:info] = "Merchant Information Updated"
    # end
  end

  private

  def merchant_params
    params.permit(:name, :status)

  end
end