class HeroesController < ApplicationController
  before_action :set_hero, only: [:show, :edit, :update, :destroy]
  before_action :set_heroeattribute, only: [:create, :update]

  before_action :authenticate_user!, except: [:index, :show]

  # GET /heroes
  # GET /heroes.json
  def index
    @heroes = Heroe.all
  end

  # GET /heroes/1
  # GET /heroes/1.json
  def show
  end

  # GET /heroes/new
  def new
    @heroe = Heroe.new
  end

  # GET /heroes/1/edit
  def edit
    @ability = Ability.new
  end

  # POST /heroes
  # POST /heroes.json
  def create
    @heroe = Heroe.new(hero_params)
    @heroe.heroeattribute =  @heroeattribute

    respond_to do |format|
      if @heroe.save
        format.html { redirect_to @heroe, notice: 'Heroe was successfully created.' }
        format.json { render :show, status: :created, location: @heroe }
      else
        format.html { render :new }
        format.json { render json: @heroe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /heroes/1
  # PATCH/PUT /heroes/1.json
  def update
    respond_to do |format|
      if @heroe.update(hero_params)
        format.html { redirect_to @heroe, notice: 'Heroe was successfully updated.' }
        format.json { render :show, status: :ok, location: @heroe }
      else
        format.html { render :edit }
        format.json { render json: @heroe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /heroes/1
  # DELETE /heroes/1.json
  def destroy
    @heroe.destroy
    respond_to do |format|
      format.html { redirect_to heroes_url, notice: 'Heroe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hero
      @heroe = Heroe.find(params[:id])
    end

    def set_heroeattribute
      @heroeattribute = Heroeattribute.find(params[:heroe][:heroeattribute_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hero_params
      params.require(:heroe).permit(:name, :description , :video, :heroeattribute_id, :image)
    end
end
