class HeroeSetsController < ApplicationController
  before_action :set_heroe_set, only: [:show, :edit, :update, :destroy]
  before_action :set_heroe , only: [:show, :edit, :update, :destroy]


  # GET /heroe_sets
  # GET /heroe_sets.json
  def index
    @heroe_sets = HeroeSet.all()
    #@heroe_sets = HeroeSet.all
  end

  # GET /heroe_sets/1
  # GET /heroe_sets/1.json
  def show
  end

  # GET /heroe_sets/new
  def new
    @heroe_set = HeroeSet.new()
    @heroe_set.heroe = @heroe
  end

  # GET /heroe_sets/1/edit
  def edit
  end

  # POST /heroe_sets
  # POST /heroe_sets.json
  def create
    @heroe_set = HeroeSet.new(heroe_set_params)

    respond_to do |format|
      if @heroe_set.save
        format.html { redirect_to @heroe_set, notice: 'Heroe set was successfully created.' }
        format.json { render :show, status: :created, location: @heroe_set }
      else
        format.html { render :new }
        format.json { render json: @heroe_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /heroe_sets/1
  # PATCH/PUT /heroe_sets/1.json
  def update
    respond_to do |format|
      if @heroe_set.update(heroe_set_params)
        format.html { redirect_to @heroe_set, notice: 'Heroe set was successfully updated.' }
        format.json { render :show, status: :ok, location: @heroe_set }
      else
        format.html { render :edit }
        format.json { render json: @heroe_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /heroe_sets/1
  # DELETE /heroe_sets/1.json
  def destroy
    @heroe_set.destroy
    respond_to do |format|
      format.html { redirect_to heroe_sets_url, notice: 'Heroe set was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_heroe
      @heroe = Heroe.find(params[:hero_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_heroe_set
      @heroe_set = HeroeSet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def heroe_set_params
      params.require(:heroe_set).permit(:title, :description, :active, :heroe_id, :cost)
    end
end
