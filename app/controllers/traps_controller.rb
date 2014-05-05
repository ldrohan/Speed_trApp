class TrapsController < ApplicationController
	def new
		@trap = Trap.new
	end	
end
