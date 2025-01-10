class PortfoliosController < ApplicationController
  layout 'portfolios'
  before_action :set_portfolio_item, only: %i[show edit update destroy]
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all

  def index
    @portfolio_items = Portfolio.all
  end

  def angular
    @angular_items = Portfolio.angular
  end

  def show
  end

  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
  end

  def edit
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: "Portfolio was successfully created." }
      end
    end
  end

  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: "Portfolio was successfully updated." }
      end
    end
  end

  def destroy
    @portfolio_item.destroy!

    respond_to do |format|
      format.html { redirect_to portfolios_path, notice: "Portfolio was successfully deleted." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio_item
      @portfolio_item = Portfolio.find(params[:id])
    end

    def portfolio_params
      params.require(:portfolio).permit(:title, :subtitle, :body, technologies_attributes: [:name])
    end
end
