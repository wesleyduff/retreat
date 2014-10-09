class CabinsController < ApplicationController
  before_action :set_cabin, only: [:show, :edit, :update, :destroy]
  before_action :cabin_types, only: [:edit, :update, :new]
  
  # GET /cabins
  # GET /cabins.json
  def index
    @cabins = Cabin.all
  end

  # GET /cabins/1
  # GET /cabins/1.json
  def show
  end
  
  def people
    @cabin = Cabin.find(params[:id])
  end

  # GET /cabins/new
  def new
    @cabin = Cabin.new
  end

  # GET /cabins/1/edit
  def edit
  end

  # POST /cabins
  # POST /cabins.json
  def create
    @cabin = Cabin.new(cabin_params)
    respond_to do |format|
      if @cabin.save
        format.html { redirect_to @cabin, notice: 'Cabin was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cabin }
      else
        format.html { render action: 'new' }
        format.json { render json: @cabin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cabins/1
  # PATCH/PUT /cabins/1.json
  def update
    respond_to do |format|
      if @cabin.update(cabin_params)
        format.html { redirect_to @cabin, notice: 'Cabin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cabin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cabins/1
  # DELETE /cabins/1.json
  def destroy
    @cabin.destroy
    respond_to do |format|
      format.html { redirect_to cabins_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cabin
      @cabin = Cabin.find(params[:id])
    end
    
    def cabin_types
       @cabinTypes = [['Male', 'male'], ['Female', 'female'], ['Family', 'family']]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cabin_params
      params.require(:cabin).permit(:name, :available, :gender, :description, :max)
    end
end
