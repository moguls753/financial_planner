class EmploymentContractsController < ApplicationController
  def new
    @employment_contract = Current.user.employment_contracts.new
  end

  def create
    @employment_contract = Current.user.employment_contracts.new(employment_contract_params)
    if @employment_contract.save
      redirect_to root_path, notice: "Arbeitsvertrag angelegt!"
    else
      flash.now[:alert] = @employment_contract.errors.full_messages.first
      render :index, status: :unprocessable_entity
    end
  end

  def update
    @employment_contract = Current.user.employment_contracts.find(params[:id])
    if @employment_contract.update(employment_contract_params)
      redirect_to root_path, notive: "Arbeitsvertrag erfoglreich bearbeited"
    else
      flash.now[:alert] = @employment_contract.errors.full_messages.first
      render :new, status: :unprocessable_entity
    end
  end

  private

  def employment_contract_params
    params.require(:employment_contract).permit(:organisation, :brutto, :netto, :vacation, :working_hours)
  end

end
