class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    #index page
    @categories = Category.all.paginate(:page => params[:page], :per_page => 5).order('name')
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    #products in category page(s)
    #find products correspoding to the category, paginate it to 5 items/page and order it by product name ASC
    @products = Category.find(params[:id]).products.paginate(:page => params[:page], :per_page => 5).order('name')
    #@products = Product.where(:category_id => params[:id]).paginate(:page => params[:page]).order('id DESC')
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  #this function will be called when user clicks the form submit button
  def seed
    # get csv url from user
    @csv_url = params[:csv_url]
    @page_string = ""
    
    #functionality for user to input csv URL
    #  require 'open-uri'
    #    open(@csv_url) do |f|
    #    @page_string = f.read
    #  end
      
    #  File.open('db/seeds_data/products.csv', 'w') do |file|
    #    file << @page_string
    #  end

    Rails.application.load_seed
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name)
    end
end
