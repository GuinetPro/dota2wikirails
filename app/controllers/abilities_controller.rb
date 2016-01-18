class AbilitiesController < ApplicationController

  before_action :set_ability, only: [:edit, :update, :destroy]
  before_action :set_heroe


  def new
    @ability = Ability.new
  end

  def create
    #@ability = Ability.new(ability_params)

    @ability =  Ability.new()
    @ability.heroe = @heroe
    @ability.image =  params[:file]
    @ability.name = params[:name]
    @ability.description = params[:description]

    if @ability.save
      render json: @ability, status: 201
    else
      render json: {errors: @ability.errors}, status: 422
    end

  end



  def edit

  end

  def index
    @habilidades = Ability.where(heroe_id: params[:hero_id])
    #render json: @habilidades, status: 201
  end

  def update


#raise params.inspect



      @ability.name = params[:name]
      @ability.description = params[:description]

      if @ability.update(ability_params)
        render json: @ability, status: 201
      else
        render json: {errors: @ability.errors}, status: 422
      end

  end

  def destroy
    if @ability.destroy
        render json: {success: "Habilidad eliminada"}, status: 200
      else
        render json: {errors: @ability.errors}, status: 422
      end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_heroe
      @heroe = Heroe.find(params[:hero_id])
    end

    def set_ability
      @ability = Ability.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ability_params
      params.require(:ability).permit(:name, :description , :video, :heroe_id, :image)
    end

end
