class InstalmentsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_instalment, only: [:show, :edit, :update, :destroy]

  # GET /instalments
  # GET /instalments.json
  def index
    @committee = Committee.find(params[:committee_id])
    @instalments = @committee.instalments.reverse
    respond_to do |format|
    	format.json  { render :json => @instalments.to_json }
    end
  end

  # GET /instalments/1
  # GET /instalments/1.json
  def show
  end

  # GET /instalments/new
  def new
    @instalment = Instalment.new
  end

  # GET /instalments/1/edit
  def edit
  end

  # POST /instalments
  # POST /instalments.json
  def create
    @committee = Committee.find(params[:committee_id])
    @instalment = @committee.instalments.create(instalment_params)

    respond_to do |format|
      if @instalment
        format.json { render json: @instalment.to_json, status: :created}
      else
        format.json { render json: @instalment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instalments/1
  # PATCH/PUT /instalments/1.json
  def update
    respond_to do |format|
      if @instalment.update(instalment_params)
        format.json { render :show, status: :ok, location: @instalment }
      else
        format.json { render json: @instalment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instalments/1
  # DELETE /instalments/1.json
  def destroy
    @instalment.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instalment
      @instalment = Instalment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instalment_params
      params.require(:instalment).permit(:name, :amount)
    end
end
