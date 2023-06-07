class Admin::MerchantsController < ApplicationController
  def index
    @merchants = Merchant.all
    @enabled_merchants = Merchant.enabled_merchants
    @disabled_merchants = Merchant.disabled_merchants
  end

  def new
  end

  def create
    Merchant.create!(merchant_params)
    redirect_to(admin_merchants_path)
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
    redirect_to(admin_merchants_path) if params[:commit] == "Enable" || params[:commit] == "Disable"
    redirect_to(admin_merchant_path(@merchant)) if params[:commit] == "Submit"
    flash[:info] = "Merchant Information Updated"
  end

  private

  def merchant_params
    params.require(:merchant).permit(:name, :status)
  end
end