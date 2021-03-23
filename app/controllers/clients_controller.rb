class ClientsController < ApplicationController
  def index
    @clients = Client.all
  end
  
  def new
    @client = Client.new
  end
  
  
  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to clients_path
    else
      render :new
    end
  end

  def show
    
  end

  def edit
  end

  def destory
  end

  private
  def client_params
    params.require(:client).permit(:image, :name, :gender, :address, :phone_number, :email).merge(user_id: current_user.id)
  end

end
