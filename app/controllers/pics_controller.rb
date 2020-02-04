class PicsController < ApplicationController
  before_action :authenticate_user!
  before_action :prepare_organization
  before_action :prepare_pic, only: [:edit, :show, :destroy, :update]

  def new
    @pic = @organization.pics.new
  end

  def create
    @pic = @organization.pics.new(permitted_params)
    if @pic.save
      flash[:notice] = "Pic Organization Successfully Created"
      redirect_to organization_path(@organization)
    else
      flash[:alert] = @pic.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    if @pic.update(permitted_params)
      flash[:notice] = "Pic Organization Successfully Updated"
      redirect_to organization_path(@organization)
    else
      flash[:alert] = @pic.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @pic.destroy
      flash[:notice] = "Pic Organization Successfully Deleted"
      redirect_to organization_path(@organization)
    else
      flash[:alert] = @pic.errors.full_messages
      redirect_to organization_path(@organization)
    end
  end

  private
    def permitted_params
      params.require(:person).permit(:name, :phone, :email, :avatar)
    end

    def prepare_organization
      @organization = Organization.find(params[:organization_id])
    end

    def prepare_pic
      @pic = @organization.pics.find(params[:id])
    end
end
