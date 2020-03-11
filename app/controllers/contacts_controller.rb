class ContactsController < ApplicationController
   def show
    @contact = Contact.find(params[:id])
    @flat = Flat.new
  end

  def new
    @flat = Flat.find(params[:flat_id])
    @contact = Contact.new
  end

  def create
    @flat = Flat.find(params[:flat_id])
    @contact = Contact.new(contact_params)
    @contact.flat = @flat
    if @contact.save
      redirect_to flat_path(@flat)
    else
      render :new 
    end
  end

  def update
    set_contact
  end

  def edit
    set_contact
  end

  def destroy
    set_contact
    authorize @contact
    @contact.destroy
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:phone_number, :address, :description)
  end
end
