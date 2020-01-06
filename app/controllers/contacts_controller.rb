class ContactsController < ApplicationController
  def index         # GET /contacts
    @contacts = Contact.all
  end

  # def show          # GET /contacts/:id
  # end

  def new           # GET /contacts/new
    @contact = Contact.new
  end

  def create        # POST /contacts
    @contact = Contact.new(contact_params)
    @contact.save
    redirect_to root
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
