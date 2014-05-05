class TrapsController < ApplicationController
	def new
      @trap = Trap.new
	end	
      
	def create
      # @trap = Trap.new(trap_params)
      #   respond_to do |format|
      #     if @trap.save
      #     	format.html { redirect_to @trap, notice: 'Your trap was created successfully'}
      #     	format.js { }
      #     else
      #       redirect_to '/traps/new'
      #     end  		
	end	
end
