class BlastsController < ApplicationController
	def create
  	@blast = Blast.create(blast_params)

  	blast_it = BlastIt.new()
  	blast_it.send_mass_text()
  end

  def new
  	@blast = Blast.new
  end
  protected
  	def blast_params
  		params.require(:blast).permit(:content, :event_id)
  	end
end
