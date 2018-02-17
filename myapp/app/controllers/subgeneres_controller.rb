class SubgeneresController < ApplicationController
  before_action :check_login
  @@id_sub = 0
  before_action :set_subgenere, only: [:show, :edit, :update, :destroy]

  # GET /subgeneres
  # GET /subgeneres.json
  def index
    if params[:id] != nil
      @@id_sub = params[:id]
    end
    @subgeneres = Subgenere.where(genere_id: @@id_sub)
    @acc = Array.new
    @subgeneres.each do |sub|
      @acc << Score.find_by(user_id: current_user.id , subgenere_id: sub.id)
    end
  end

  

  # GET /subgeneres/1
  # GET /subgeneres/1.json
  def show
    rr = params[:id]
    puts rr
    redirect_to :controller => 'questions' , :action => 'index' , id: rr 
  end


  def leader
    puts "leader"
    puts params[:id]
    scores = Score.where(subgenere_id: params[:id])
    puts scores
    arr = Array.new
    scores.each do |sco|
      obj = User.find_by(id: sco.user_id)
      arr1 = Array.new
      arr1 << obj.name
      arr1 << sco.score
      arr << arr1
    end
    render 'leader', :locals => {:arr => arr }
  end

  # GET /subgeneres/new
  def new
    @subgenere = Subgenere.new
  end

  # GET /subgeneres/1/edit
  def edit
  end

  # POST /subgeneres
  # POST /subgeneres.json
  def create
    if current_user.id == 1

      puts @@id_sub
      puts params[:subgenere][:name]
      @subgenere = Subgenere.new(name: params[:subgenere][:name],genere_id: @@id_sub)

      respond_to do |format|
        if @subgenere.save
          format.html { redirect_to @subgenere, notice: 'Subgenere was successfully created.' }
          format.json { render :show, status: :created, location: @subgenere }
        else
          format.html { render :new }
          format.json { render json: @subgenere.errors, status: :unprocessable_entity }
        end
      end
    else
      flash.now[:danger] = "you must be admin to do that operation"
      redirect_to root_path
    end
  end

  # PATCH/PUT /subgeneres/1
  # PATCH/PUT /subgeneres/1.json
  def update
    if current_user.id == 1
      respond_to do |format|
        if @subgenere.update(name: params[:subgenere][:name] , genere_id: @@id_sub)
          format.html { redirect_to @subgenere, notice: 'Subgenere was successfully updated.' }
          format.json { render :show, status: :ok, location: @subgenere }
        else
          format.html { render :edit }
          format.json { render json: @subgenere.errors, status: :unprocessable_entity }
        end
      end
    else
      flash.now[:danger] = "you must be admin to do that operation"
      redirect_to root_path
    end
  end

  # DELETE /subgeneres/1
  # DELETE /subgeneres/1.json
  def destroy
    if current_user.id == 1
      @subgenere.destroy
      respond_to do |format|
        format.html { redirect_to subgeneres_url, notice: 'Subgenere was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      flash.now[:danger] = "you must be admin to do that operation"
      redirect_to root_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subgenere
      @subgenere = Subgenere.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subgenere_params
      #str.concat("")
      #params.require(:subgenere).permit(:name, :genere_id)
    end
end
