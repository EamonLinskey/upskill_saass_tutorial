class ContactsController < ApplicationController
    
    # GET request to /contact-us
    # Show new contact form
    def new
        @contact = Contact.new
    end
    
    # POST request /contacts
    def create
        # Mass assignemnt of form field into contact objects
        @contact = Contact.new(contact_params)
        if @contact.save
            # Store sucess message in flash hash
            flash[:success] = "Message Sent"
            # Store form fields via paramaters into variables
            name = params[:contact][:name]
            email = params[:contact][:email]
            body = params[:contact][:comments]
            # Plug variables into Contact mailer method and send email
            ContactMailer.contact_email(name, email, body).deliver
            redirect_to contact_us_path
        else
            # If contact object doesn't store errors message in flash hash and 
            # redirect to new action
            flash[:danger] = "An Error occured: " + @contact.errors.full_messages.join(", ")
            redirect_to contact_us_path
        end
    end    

    private
        # To collect data from  form we need to use strong 
        # paramaters and whitelist form fields
        def contact_params
            params.require(:contact).permit(:name, :email, :comments)
        end
end
        
