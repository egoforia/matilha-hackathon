class FieldOfWorksController < ApplicationController
  before_action :set_field_of_work, only: [:show, :edit, :update, :destroy]

  # GET /field_of_works
  # GET /field_of_works.json
  def index
    @field_of_works = FieldOfWork.all
  end

  # GET /field_of_works/1
  # GET /field_of_works/1.json
  def show
  end

  # GET /field_of_works/new
  def new
    @field_of_work = FieldOfWork.new
  end

  # GET /field_of_works/1/edit
  def edit
  end

  # POST /field_of_works
  # POST /field_of_works.json
  def create
    @field_of_work = FieldOfWork.new(field_of_work_params)

    respond_to do |format|
      if @field_of_work.save
        format.html { redirect_to @field_of_work, notice: 'Field of work was successfully created.' }
        format.json { render :show, status: :created, location: @field_of_work }
      else
        format.html { render :new }
        format.json { render json: @field_of_work.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /field_of_works/1
  # PATCH/PUT /field_of_works/1.json
  def update
    respond_to do |format|
      if @field_of_work.update(field_of_work_params)
        format.html { redirect_to @field_of_work, notice: 'Field of work was successfully updated.' }
        format.json { render :show, status: :ok, location: @field_of_work }
      else
        format.html { render :edit }
        format.json { render json: @field_of_work.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /field_of_works/1
  # DELETE /field_of_works/1.json
  def destroy
    @field_of_work.destroy
    respond_to do |format|
      format.html { redirect_to field_of_works_url, notice: 'Field of work was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_field_of_work
      @field_of_work = FieldOfWork.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def field_of_work_params
      params.require(:field_of_work).permit(:title)
    end
end
