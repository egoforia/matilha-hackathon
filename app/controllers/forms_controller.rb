class FormsController < ApplicationController
  before_action :authenticate_lawyer!
  before_action :set_form, only: [:show, :edit, :update, :destroy, :send_email]

  # GET /forms
  # GET /forms.json
  def index
    @forms = Form.all
  end

  # GET /forms/1
  # GET /forms/1.json
  def show
  end

  # GET /forms/new
  def new
    @form = Form.new
    @types = FieldType.all
  end

  # GET /forms/1/edit
  def edit
    @types = FieldType.all
  end

  # POST /forms
  # POST /forms.json
  def create
    @form = Form.new(form_params)

    @form.lawyer = current_lawyer

    respond_to do |format|
      if @form.save

        params[:questions].each do |i, question_param|
          question = Question.new
          question.form = @form
          question.assign_attributes(questions_params(i))
          question.save
        end

        format.html { redirect_to @form, notice: 'Form was successfully created.' }
        format.json { render :show, status: :created, location: @form }
      else
        format.html { render :new }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forms/1
  # PATCH/PUT /forms/1.json
  def update
    respond_to do |format|
      if @form.update(form_params)
        params[:questions].each do |i, question_param|
          question = nil
          if question_param.has_key? :id
            question = Question.find question_param[:id]
            question.update_attributes(questions_params(i).except(:id))
          else
            question = Question.new
            question.form = @form
            question.assign_attributes(questions_params(i))
            question.save
          end

          if params[:questions][i].has_key? :question_options
            params[:questions][i][:question_options].each do |j, question_option_param|
              question_option = QuestionOption.new
              question_option.question = question
              question_option.assign_attributes(question_options_params(i, j))
              question_option.save
            end
          end
        end

        format.html { redirect_to @form, notice: 'Form was successfully updated.' }
        format.json { render :show, status: :ok, location: @form }
      else
        format.html { render :edit }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forms/1
  # DELETE /forms/1.json
  def destroy
    @form.destroy
    respond_to do |format|
      format.html { redirect_to forms_url, notice: 'Form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def send_email
    respond_to do |format|
      user = User.new(user_params)

      if user.save
        UserNotifier.send_form(user, @form).deliver_now
        format.html { redirect_to @form, notice: 'Email enviado com sucesso' }
        format.json { render :show, status: :ok, location: @form }
      else
        format.html { render :edit }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form
      @form = Form.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def form_params
      params.require(:form).permit(:name, :lawyer_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def questions_params(i)
      params.require(:questions).require(i.to_s.to_sym).permit(:id, :title, :field_type_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_options_params(i, j)
      params.require(:questions).require(i.to_s.to_sym).require(:question_options).require(j.to_s.to_sym).permit(:id, :title)
    end
end
