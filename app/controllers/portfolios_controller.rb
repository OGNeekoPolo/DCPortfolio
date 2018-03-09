class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:edit, :update, :destroy, :show]
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all
  layout 'portfolio'

  def index
    @portfolio_items = Portfolio.by_poistion
  end

  def show; end

  def new
    @portfolio_item = Portfolio.new
    @button_title = 'Add Portfolio Item'
    3.times { @portfolio_item.technologies.build }
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)
    if @portfolio_item.save
      redirect_to portfolios_path, notice: 'Portfolio was successfully created!'
    else
      render :new
    end
  end

  def edit
    @button_title = 'Update Portfolio Item'
    3.times { @portfolio_item.technologies.build }
  end

  def update
    if @portfolio_item.update(portfolio_params)
      redirect_to portfolios_path, notice: 'Portfolio was successfully updated!'
    else
      render :edit
    end
  end

  def destroy
    @portfolio_item.destroy
    redirect_to portfolios_path
  end

  private

  def set_portfolio
    @portfolio_item = Portfolio.find(params[:id])
  end

  def portfolio_params
    params.require(:portfolio).permit(:title, :subtitle, :body, technologies_attributes: [:name])
  end
end
