class ContactsController < ApplicationController
  def import
  	@success = Contact.import(params[:contact][:file])
  end
  def new_import
  	@contact = Contact.new
  end
end
