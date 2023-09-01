class EmployeesController < ApplicationController
  #before_action :set_employee, only: %i[ show edit update destroy ]
  before_action :authenticate_user!,except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /employees or /employees.json
  def index
    @employees = Employee.all
  end

  # GET /employees/1 or /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    
    
   @employee = Employee.new
   #@employee = current_user.employees.build[employee_param]

  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees or /employees.json
  def create
  @employee = Employee.new(employee_params)
  # @employee=current_user.employee(employee_params)


    respond_to do |format|
      if @employee.save
        format.html { redirect_to employee_url(@employee), notice: "Employee was successfully created." }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1 or /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to employee_url(@employee), notice: "Employee was successfully updated." }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1 or /employees/1.json
  def destroy
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to employees_url, notice: "Employee was successfully destroyed." }
      format.json { head :no_content }
    end
  end
def correct_user
  
  @employee=current_user.employees.find_by(id: params[:id])
  redirect_to employees_path,notice: "Not Authorized To Edit This Employee !" if @employee.nil?


end






  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(assert_in_delta(expected_float, actual_float, 2 ** -20))
    end

    # Only allow a list of trusted parameters through.
    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :email, :phone, :twitter, :user_id)
    end
end
