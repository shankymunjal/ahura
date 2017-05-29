class PayeesController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_payee, only: [:show, :edit, :update, :destroy]

  # GET /payees
  # GET /payees.json
  def index
    @committee = Committee.find(params[:committee_id])
    @payees = @committee.payees.reverse
    respond_to do |format|
    	format.json  { render :json => @payees.to_json }
    end
  end

  # GET /payees/1
  # GET /payees/1.json
  def show
  end

  # GET /payees/new
  def new
    @payee = Payee.new
  end

  # GET /payees/1/edit
  def edit
  end

  # POST /payees
  # POST /payees.json
  def create
    @committee = Committee.find(params[:committee_id])
    @payee = @committee.payees.new(payee_params)
    @payee.user_id = params[:user_id]

    respond_to do |format|
      if @payee.save
        format.json { render json: @payee.to_json, status: :created}
      else
        format.json { render json: @payee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payees/1
  # PATCH/PUT /payees/1.json
  def update
    respond_to do |format|
      if @payee.update(payee_params)
        format.json { render :show, status: :ok, location: @payee }
      else
        format.json { render json: @payee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payees/1
  # DELETE /payees/1.json
  def destroy
    @payee.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payee
      @payee = Payee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payee_params
      params.require(:payee).permit(:name, :amount)
    end
end
