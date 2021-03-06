class TrapsController < ApplicationController
	include TrapsHelper
	before_filter :signed_in_user, only: [:create, :new, :edit, :destroy]
	before_filter :check_trap_owner, only: [:edit, :destroy]

	def new
      @trap = Trap.new
	end	
      
	def create
	  @trap = Trap.new(lat: params["lat"].to_f, long: params["long"].to_f)
	  @trap.user_id = @current_user.id
      @trap.save
      send_text_message
      
      #binding.pry
        # respond_to do |format|
        #   if @trap.save
        #   	format.html { redirect_to @trap, notice: 'Your trap was created successfully'}
        #   	format.js { }
        #   else
        #     redirect_to '/traps/new'
        #   end  
        # redirect_to '/traps/show'		
	end

	def show
	  gon.traps = Trap.all
	  #Traffic Data API Request
	  results = Typhoeus.get("http://dev.virtualearth.net/REST/v1/Traffic/Incidents/25,-122.325,47.610,-122.107?key=AgibBbdCMDidBLcSduQjcepb68zIEOYu-w3NQr-5gAa1ixpTrX-foJjmnoHwi5qL")
      traffic_data = JSON.parse(results.body)
      resources = traffic_data["resourceSets"][0]["resources"]

      gon.coords = []
      gon.description = []	
      resources.each do |t|
      	gon.coords.push (t["point"]["coordinates"])
      	gon.description.push (t["description"])
      end	 
	end	
	
	def send_text_message
      number_to_send_to = +18457971090#params[:number_to_send_to]
 
      twilio_sid = ENV["TWILIO_SID"]
      twilio_token = ENV["TWILIO_TOKEN"]
      twilio_phone_number = +18456350218
 
      @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
 
      @twilio_client.account.sms.messages.create(
        :from => "+1#{8456350218}",
        :to => "+1#{8457971090}",
        :body => "Your Trap has been set. Watch out for the Po-Po!"
        )  
  end
    
	def destroy
		trap = Trap.find(params[:id])
		trap.delete
		redirect_to users_path
	end	


end
