class QuestionsController < ApplicationController
  before_action :check_login
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  @@id_q = 0
  # GET /questions
  # GET /questions.json
  def index
    puts params[:id]
    if params[:id] != nil
      @@id_q = params[:id]
    end
    puts @@id_q
    @questions = Question.where(subgenere_id: @@id_q)
    @userans = Useran.where(user_id: current_user.id)
    @scor = Score.find_by(user_id: current_user.id , subgenere_id: @@id_q)
  end


  

  def check

    mystring = ""
    q = Question.find_by(id: params[:qid])
    if params[:opa] != nil
      mystring.concat(q.opa)
    end
    if params[:opb] != nil
      mystring.concat(q.opb)
    end
    if params[:opc] != nil
      mystring.concat(q.opc)
    end
    if params[:opd] != nil
      mystring.concat(q.opd)
    end
    puts mystring
    if mystring == q.ans
      kk = Useran.new(comp: 1 ,user_id: current_user.id ,question_id: q.id )
      ss = Score.find_by(user_id: current_user.id , subgenere_id: @@id_q)
      puts ss
      if ss == nil
        puts "nil entered"
        ss = Score.new(score: 4 , user_id: current_user.id , subgenere_id: @@id_q)
        ss.save
      else
        p_score = ss.score  
        p_score += 4
        ss.update(score: p_score , user_id: current_user.id , subgenere_id: @@id_q)
      end
      kk.save
      redirect_to :action => 'index'
    else
      kkk = Useran.new(comp: 0 ,user_id: current_user.id ,question_id: q.id )
      kkk.save
      redirect_to :action => 'index'

    end
  end
  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    if current_user.id == 1
      @question = Question.new(ques: params[:question][:ques] , opa: params[:question][:opa] , opb: params[:question][:opb],
          opc: params[:question][:opc] , opd: params[:question][:opd] ,ans: params[:question][:ans],subgenere_id: @@id_q)

      respond_to do |format|
        if @question.save
          format.html { redirect_to @question, notice: 'Question was successfully created.' }
          format.json { render :show, status: :created, location: @question }
        else
          format.html { render :new }
          format.json { render json: @question.errors, status: :unprocessable_entity }
        end
      end
    else
      flash.now[:danger] = "you must be admin to do that operation"
      redirect_to root
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    if current_user.id == 1
      respond_to do |format|
        if @question.update(ques: params[:question][:ques] , opa: params[:question][:opa] , opb: params[:question][:opb],
          opc: params[:question][:opc] , opd: params[:question][:opd] ,ans: params[:question][:ans],subgenere_id: @@id_q)
          format.html { redirect_to @question, notice: 'Question was successfully updated.' }
          format.json { render :show, status: :ok, location: @question }
        else
          format.html { render :edit }
          format.json { render json: @question.errors, status: :unprocessable_entity }
        end
      end
    else
      flash.now[:danger] = "you must be admin to do that operation"
      redirect_to root
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    if current_user.id == 1
      @question.destroy
      respond_to do |format|
        format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      flash.now[:danger] = "you must be admin to do that operation"
      redirect_to root
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:ques, :opa, :opb, :opc, :opd, :ans, :subgenere_id)
    end
end
