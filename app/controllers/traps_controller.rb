class TrapsController < ApplicationController
	include TrapsHelper
	before_filter :signed_in_user, only: [:create, :new, :edit, :update, :destroy]
	before_filter :check_trap_owner, only: [:edit, :update, :destroy]

	def new
      @trap = Trap.new
	end	
      
	def create
	  @trap = Trap.new(name: "Luke", lat: params["lat"].to_f, long: params["long"].to_f)
      @trap.save
      #binding.pry
        # respond_to do |format|
        #   if @trap.save
        #   	format.html { redirect_to @trap, notice: 'Your trap was created successfully'}
        #   	format.js { }
        #   else
        #     redirect_to '/traps/new'
        #   end  		
	end

	def show
		gon.traps = Trap.all
		#binding.pry
	end	

	def destroy
		trap = Trap.find(params[:id])
		trap.delete
		redirect_to users_path
	end	
end
