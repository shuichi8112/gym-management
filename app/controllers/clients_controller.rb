class ClientsController < ApplicationController
  def index
    @clients = Client.all
  end
  
  def new
    @client = Client.new
  end

  def create
    @client = Client.new
    if @client.save
      redirect to clients path
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
end
