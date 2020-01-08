class ContactsController < ApplicationController
  def index        # GET /contacts
    @contacts = Contact.all
  end

  # def show          # GET /contacts/:id
  # end

  def new           # GET /contacts/new
    @contact = Contact.new
  end

  def create        # POST /contacts
    @contact = Contact.new(contact_params)
    respond_to do |format|
      if @contact.save
      # Tell the ContactMailer to send a "thank you" email after save - only if the contact form is correctly filled in
        UserMailer.with(contact: @contact).thank_you_email.deliver_now

        format.html { redirect_to(@contact, notice: 'Request correctly submitted.') }
        format.json { render json: @cnotact, status: :created, location: @contact }
      else
        format.html { render action: 'new' }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
    redirect_to root_path
  end

  # def edit          # GET /contacts/:id/edit
  # end

  # def update        # PATCH /contacts/:id
  # end

  def destroy       # DELETE /contacts/:id
    @contact = Contact.find(params[:id])
    @contact.destroy
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :phone, :email)
  end
end
