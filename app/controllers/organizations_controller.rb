class OrganizationsController < ApplicationController
  before_action :authenticate_user!
  before_action :prepare_organization, only: [:edit, :show, :destroy, :update]

  def index
    @organizations = Organization.all
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(permitted_params)
    if @organization.save
      flash[:notice] = "Organization Successfully Created"
      update_organization(@organization.id)
      redirect_to edit_organization_path(@organization)
    else
      flash[:alert] = @organization.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    if @organization.update(permitted_params)
      flash[:notice] = "Organization Successfully Updated"
      redirect_to organizations_path
    else
      flash[:alert] = @organization.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @organization.destroy
      flash[:notice] = "Organization Successfully Deleted"
      redirect_to organizations_path
    else
      flash[:alert] = @organization.errors.full_messages
      redirect_to organizations_path
    end
  end

  def show
    @pics = @organization.pics.all
  end

  private
    def permitted_params
      params.require(:organization).permit(:name, :email, :phone, :website, :logo, pics: [:id, :name, :phone, :email, :avatar, :_destroy])
    end

    def prepare_organization
      @organization = Organization.find(params[:id])
    end

    def update_organization(organization_id)
      User.where(id: current_user.id).update_all(organization_id: organization_id)
    end
end
