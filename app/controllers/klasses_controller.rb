class KlassesController < ApplicationController
  before_action :set_klass, only: [:show, :edit, :update, :destroy]
  before_action :authorized_to_view?, only: [:show, :edit, :update, :destroy]

  # GET /klasses
  # GET /klasses.json
  def index
    @klasses = Klass.all
  end

  # GET /klasses/1
  # GET /klasses/1.json
  def show
  end

  # GET /klasses/new
  def new
    @klass  = Klass.new
    @school = School.find(params[:school])
  end

  # GET /klasses/1/edit
  def edit
  end

  # POST /klasses
  # POST /klasses.json
  def create
    @klass = Klass.new(klass_params)
    @klass.active!
    @school = School.find(params[:klass][:school])
    @klass.school = @school
    @klass.register(:write, :teacher, current_user)
    respond_to do |format|
      if @klass.save
        format.html { redirect_to @klass, notice: 'Class was successfully created.' }
        format.json { render :show, status: :created, location: @klass }
      else
        format.html { render :new }
        format.json { render json: @klass.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /klasses/1
  # PATCH/PUT /klasses/1.json
  def update
    respond_to do |format|
      if @klass.update(klass_params)
        format.html { redirect_to @klass, notice: 'Klass was successfully updated.' }
        format.json { render :show, status: :ok, location: @klass }
      else
        format.html { render :edit }
        format.json { render json: @klass.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /klasses/1
  # DELETE /klasses/1.json
  def destroy
    @klass.destroy
    respond_to do |format|
      format.html { redirect_to klasses_url, notice: 'Klass was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  protected
    def set_klass
      @klass = Klass.find(params[:id])
    end

    def registered?
      if !@klass.registered?(current_user)
        flash[:alert] = "You are not registered for this class!"
        redirect_to :back
      end
    end

    def authorized_to_view?
      if !@klass.authorized_to_view?(current_user)
        flash[:alert] = "You are not registered for this class!"
        redirect_to :back
      end
    end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def klass_params
      params.require(:klass).permit(:name)
    end
end
