class Backoffice::AdminsController < BackofficeController
  before_action :set_admin, only: [:edit, :update, :destroy]
  after_action :verify_authorized, only: [:new, :destroy]

  def index
    @admins = policy_scope(Admin)
  end

  def new
    @admin = Admin.new
    authorize @admin
  end

  def create
    @admin = Admin.new(params_admin)
    if @admin.save
      redirect_to backoffice_admins_path, notice: "Administrador (#{@admin.email}) salvo com sucesso!"
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    authorize @admin
    admin_email = @admin.email
    if @admin.destroy
      redirect_to backoffice_admins_path, notice: "Administrador (#{admin_email}) excluído com sucesso!"
    else
      render :index
    end
  end

  def update
    if params[:admin][:password].blank? && params[:admin][:password_confirmation].blank?
      params[:admin].delete(:password)
      params[:admin].delete(:password_confirmation)
    end

    if @admin.update(params_admin)
      AdminMailer.update_email(current_admin, @admin).deliver_now
      redirect_to backoffice_admins_path, notice: "Administrador (#{@admin.email}) alterado com sucesso!"
    else
      render :edit
    end
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def params_admin
    params.require(:admin).permit(policy(@admin).permited_attibutes)
  end
end
