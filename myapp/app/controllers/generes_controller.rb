class GeneresController < ApplicationController
  before_action :check_login
  before_action :set_genere, only: [:show, :edit, :update, :destroy]

  # GET /generes
  # GET /generes.json
  def index
    @generes = Genere.all
  end

  # GET /generes/1
  # GET /generes/1.json
  def show
    r = params[:id] 
    puts r
    redirect_to :controller => 'subgeneres', :action => 'index' , id: r
  end

  # GET /generes/new
  def new
    @genere = Genere.new
  end

  # GET /generes/1/edit
  def edit
  end

  # POST /generes
  # POST /generes.json
  def create
    if current_user.id == 1
      @genere = Genere.new(genere_params)

      respond_to do |format|
        if @genere.save
          format.html { redirect_to @genere, notice: 'Genere was successfully created.' }
          format.json { render :show, status: :created, location: @genere }
        else
          format.html { render :new }
          format.json { render json: @genere.errors, status: :unprocessable_entity }
        end
      end  
      
    else
      flash.now[:danger] = "you must be admin to do that operation"
      redirect_to root_path
    end
  end

  # PATCH/PUT /generes/1
  # PATCH/PUT /generes/1.json
  def update
    if current_user.id == 1
      respond_to do |format|
        if @genere.update(genere_params)
          format.html { redirect_to @genere, notice: 'Genere was successfully updated.' }
          format.json { render :show, status: :ok, location: @genere }
        else
          format.html { render :edit }
          format.json { render json: @genere.errors, status: :unprocessable_entity }
        end
      end
    else
      flash.now[:danger] = "you must be admin to do that operation"
      redirect_to root_path_url , notice: "you must be admin to that operation" 
    end
  end

  # DELETE /generes/1
  # DELETE /generes/1.json
  def destroy
    if current_user.id == 1
      @genere.destroy
      respond_to do |format|
        format.html { redirect_to generes_url, notice: 'Genere was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      flash.now[:danger] = "you must be admin to do that operation"
      redirect_to root_path_url , notice: "you must be admin to do that operation"
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_genere
      @genere = Genere.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def genere_params
      params.require(:genere).permit(:name)
    end
end
