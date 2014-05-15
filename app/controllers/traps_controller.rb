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

    # It would be best to put a conditional here in case the trap doesn't save
    # You want to ensure you don't send a text unless the trap has actually been 
    # saved to the database
    send_text_message if @trap.save
      
      # Delete code you are not using
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

  # In order to conform to restful conventions I would change this method and it's route to index
  # Generally index is for lists of data where as show is for one instance of data
  # This method deals with many traps, so you should use index
	def show
	  gon.traps = Trap.all
	  #Traffic Data API Request
    # You need to move the key in this request to your .env file
	  results = Typhoeus.get("http://dev.virtualearth.net/REST/v1/Traffic/Incidents/25,-122.325,47.610,-122.107?key=AgibBbdCMDidBLcSduQjcepb68zIEOYu-w3NQr-5gAa1ixpTrX-foJjmnoHwi5qL")
    traffic_data = JSON.parse(results.body)
    resources = traffic_data["resourceSets"][0]["resources"]
    # In the future I would move the API request, and the parsing of it's data to a helper method
    # Most logic, apart from assigning variables should be kept out of our controller methods

    # So I noticed your show method and view page pull and display data from an API.
    # When you create a new trap, that is displayed also.
    # However, you never seem to pull and display all of the traps from your database.
    gon.coords = []
    gon.description = []	
    resources.each do |t|
    	gon.coords.push(t["point"]["coordinates"])
    	gon.description.push(t["description"])
    end
	end
    
	def destroy
		trap = Trap.find(params[:id])
		trap.delete
		redirect_to users_path
	end	

  private
  # Methods in your controller that are not regular controller actions 
  # (i.e. attached to routes), should go at the bottom of the file, 
  # under the word private. Or ideally, you should moves these into a helper.

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


end
