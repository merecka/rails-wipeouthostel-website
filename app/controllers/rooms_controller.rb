class RoomsController < ApplicationController

  def index
  	@rooms = Room.all
  end

  def show
  	if session[:current_user_id]
  		@room = Room.find_by(id: params[:id])
  	else
  		redirect_to '/login'
  	end
  end

  def new
  	@room = Room.new
  end

  def create
    @room = Room.create(room_params)
    if @room
    	# Redirects to the Rooms's show page
    	redirect_to rooms_path(@room)
    else
    	render :new
    end
  end

  def edit
	@room = Room.find_by(id: params[:id])
  end

  def update
	@room = Room.find_by(id: params[:id])
	@room.update(name: room_params[:name], occupancy: room_params[:occupancy], cost: room_params[:cost])
	redirect_to room_path(@room)
  end

  def destroy
  	Room.find_by(id: params[:id]).destroy
  	redirect_to rooms_path
  end

  private

  def room_params
    params.require(:room).permit(:name, :occupancy, :cost)
  end

end