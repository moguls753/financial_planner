class EmploymentContractsController < ApplicationController
  before_action :require_user_logged_in!

  def index
    @employment_contracts = Current.user.employment_contracts.all
  end

  def show
    @employment_contract = Current.user.employment_contracts.find(params[:id])
  end

  def new
    @employment_contract = Current.user.employment_contracts.new
  end

  def create
    @employment_contract = Current.user.employment_contracts.new(employment_contract_params)
    if @employment_contract.save
      redirect_to root_path, notice: "Arbeitsvertrag angelegt!"
    else
      flash.now[:alert] = @employment_contract.errors.full_messages.first
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @employment_contract = Current.user.employment_contracts.find(params[:id])
  end

  def update
    @employment_contract = Current.user.employment_contracts.find(params[:id])

    if @employment_contract.update(employment_contract_params)
      redirect_to root_path, notive: "Arbeitsvertrag erfoglreich bearbeitet"
    else
      flash.now[:alert] = @employment_contract.errors.full_messages.first
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @employment_contract = Current.user.employment_contracts.find(params[:id])
    @employment_contract.destroy

    redirect_to root_path, notice: "Vertrag gelöscht", status: :see_other
  end

  private

  def employment_contract_params
    params.require(:employment_contract).permit(:organisation, :salary_interval, :brutto, :netto, :vacation, :working_hours)
  end

end
