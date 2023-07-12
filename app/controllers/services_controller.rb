class ServicesController < ApplicationController
  before_action :redirect_if_not_authenticated

  def index
    @services = Service.where(user_id: current_user.id)
  end

  def new
    @service = Service.new
  end

  def create
    params[:service][:user_id] = current_user.id
    @service = Service.new(service_params)
    if validate_email_password
      puts service_params
      if @service.save
        redirect_to services_path, notice: "Service added successfully!"
      else
        render :new
      end
    else
      flash.now[:alert] = "Invalid email or password format."
      render :new, status: :unprocessable_entity
      # raise StandardError, "Invalid email or password format."
    end
  end
  

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
  
    if validate_email_password
      if @service.update(service_params)
        redirect_to services_path, notice: "Service updated successfully!"
      else
        render :edit
      end
    else
      flash.now[:alert] = "Invalid email or password format."
      render :edit, status: :unprocessable_entity
      # raise StandardError, "Invalid email or password format."
    end
  end


  private
  def service_params
    params.require(:service).permit(:name, :username, :password, :user_id)
  end
  
  private
  def validate_email_password
    email_pattern = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    password_pattern = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$^&*])[A-Za-z\d!@#$^&*]{8,12}$/
  
    valid_email = email_pattern.match?(service_params[:username])
    valid_password = password_pattern.match?(service_params[:password])
    puts valid_email
    puts valid_password

    valid_email && valid_password
  end
  
end
