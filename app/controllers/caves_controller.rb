class CavesController < ApplicationController
  before_action :set_cafe, only: [:show, :edit, :update, :destroy]

  # GET /caves
  # GET /caves.json
  def index
  #  @caves = Cave.all
    @caves = Cave.paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @caves }
    end
  end

  # GET /caves/1
  # GET /caves/1.json
  def show
    @cave = Cave.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cave }
    end
  end

  # GET /caves/new
  def new
    @cafe = Cave.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cave }
    end
  end

  # GET /caves/1/edit
  def edit
    @cave = Cave.find(params[:id])
  end

  # POST /caves
  # POST /caves.json
  def create
    @cafe = Cave.new(cafe_params)

    respond_to do |format|
      if @cafe.save
        format.html { redirect_to @cafe, notice: 'Cave was successfully created.' }
        format.json { render :show, status: :created, location: @cafe }
      else
        format.html { render action: "new" } # { render :new }
        format.json { render json: @cafe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /caves/1
  # PATCH/PUT /caves/1.json
  def update
    @cave = Cave.find(params[:id])

    respond_to do |format|
      if @cafe.update(cafe_params)
        format.html { redirect_to @cafe, notice: 'Cave was successfully updated.' }
        format.json { render :show, status: :ok, location: @cafe }
      else
        format.html { render :edit }
        format.json { render json: @cafe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /caves/1
  # DELETE /caves/1.json
  def destroy
    @cave = Cave.find(params[:id])
    @cafe.destroy
    
    respond_to do |format|
      format.html { redirect_to caves_url, notice: 'Cave was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cafe
      @cafe = Cave.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cafe_params
      params.require(:cave).permit(:name, :inventory_no, :length, :depth, :denivelation, :genesis, :inventory_id, :x_1992, :y_1992, :lat, :lon)
    end
end
