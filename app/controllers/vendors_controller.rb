class VendorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_vendor, only: %i[ show edit update destroy ]
  before_action :vendors_page


  # GET /all_vendors
  def all_vendors
    @vendors = Vendor.all.reverse
    @new_vendor = Vendor.new
  end


  # GET /vendors or /vendors.json
  def index
    @purchaser = Purchaser.find(params[:purchaser_id])
    @vendors = @purchaser.vendors.all.reverse
    @new_vendor = Vendor.new
  end

  # GET /vendors/1 or /vendors/1.json
  def show
    @vendor = Vendor.find(params[:id])
  end

  def new
    # @vendor = Vendor.new
    # @purchaser = Purchaser.find(params[:id])
    @purchaser = Purchaser.find(params[:purchaser_id])
    @vendor = @purchaser.vendors.build

  end

  def edit
    @vendor = Vendor.find(params[:id])
  end

  def create
    @vendor = Vendor.new(vendor_params)
    # byebug
    if @vendor.date_recieved.present? == false
      @vendor.date_recieved = DateTime.current.to_date
    end

    respond_to do |format|
      if @vendor.save
        format.html { redirect_to purchasers_path, notice: "Vendor was successfully created." }
        format.json { render :show, status: :created, location: purchasers_path }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vendors/1 or /vendors/1.json
  def update
    respond_to do |format|
      if @vendor.update(vendor_params)
        format.html { redirect_to @vendor, notice: "Vendor was successfully updated." }
        format.json { render :show, status: :ok, location: @vendor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendors/1 or /vendors/1.json
  def destroy
    @vendor.destroy
    respond_to do |format|
      format.html { redirect_to purchasers_path, notice: "Vendor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def vendors_page
      @vendors_page = true
    end

    def set_vendor
      @vendor = Vendor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vendor_params
      params.require(:vendor).permit(:name, :po_number, :date_recieved, :date_delivered, :distributed_by, :purchaser_id)
    end
end
