module TrapsHelper
	def check_trap_owner
    trap = current_user.traps.where(:id => params[:id]).first
    if trap.nil?
      flash[:error] = "That's not your Trap"
      redirect_to user_path(params[:id])
    end
  end
end
