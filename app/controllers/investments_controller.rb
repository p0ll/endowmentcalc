class InvestmentsController < ApplicationController
  before_action :set_investment, only: [:show, :edit, :update, :destroy]
  attr_accessor :type, :amount, :fin_rtn, :cost, :inv_period, :years_per_grant, :simp

  def index
    @investments = Investment.all
  end

  def show
  end

  def new(type, amount)
    @type = type
    @amount = amount
#    @fin_rtn = fin_rtn
#    @cost = cost
#    @investment = Investment.new
#    @net_fin_rtn = :fin_rtn.to_i - :cost.to_i
#    @total_inv_size = @amt * (1 + @net_fin_rtn)
#    @socimp_through_grant
#    @socimp_through_inv
  end

  def edit
  end

  def create
    @investment = Investment.new(investment_params)

    respond_to do |format|
      if @investment.save
        format.html { redirect_to @investment, notice: 'Investment was successfully created.' }
        format.json { render :show, status: :created, location: @investment }
      else
        format.html { render :new }
        format.json { render json: @investment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @investment.update(investment_params)
        format.html { redirect_to @investment, notice: 'Investment was successfully updated.' }
        format.json { render :show, status: :ok, location: @investment }
      else
        format.html { render :edit }
        format.json { render json: @investment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @investment.destroy
    respond_to do |format|
      format.html { redirect_to investments_url, notice: 'Investment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_investment
      @investment = Investment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def investment_params
      params.require(:investment).permit(:description)
    end
end
