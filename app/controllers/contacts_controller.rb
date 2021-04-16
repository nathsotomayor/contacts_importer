class ContactsController < ApplicationController
  before_action :set_contact, only: %i[ show update destroy ]
  before_action :authenticate_user!

  def index
    if user_signed_in?
      @contacts = current_user.contacts.paginate(page: params[:page], per_page: 4)
    end
  end

  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: "Contact was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:user_id, :name, :telephone, :email, :address, :birthday, :credit_card_number, :credit_card_franchise)
    end
end
