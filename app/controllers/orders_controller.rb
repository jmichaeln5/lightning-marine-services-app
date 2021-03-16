class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]
  before_action :orders_page


  def all_orders  # GET /all_orders
    @orders = Order.all
  end

  # GET /orders or /orders.json
  def index
    @vendor = Vendor.find(params[:vendor_id])
    @purchaser = @vendor.purchaser
    @orders = @vendor.orders.all
    @new_order = Order.new
    # @vendors = Vendor.all.order('name ASC')
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    @vendor = Vendor.find(params[:vendor_id])
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to purchasers_path, notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: purchasers_path }
      else
        format.html { redirect_to purchasers_path, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    def orders_page
      @orders_page = true
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:name, :po_number, :date_recieved, :date_delivered, :distributed_by, :vendor_id)
    end
end
