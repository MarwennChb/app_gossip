class GossipsController < ApplicationController
  
	def index
  
  	@gossips = Gossip.all

  end

  def new
  
  	@gossip = Gossip.new #on ne fait rien, ça sera envoyé à la vue 

  end

	def show
		
		@gossip = Gossip.find(params[:id])

		#@gossip.find(params[:id]) #l'histoire de paramètre, point à creuser

	end

	def create

		@gossip = Gossip.create(gossip_params)
		redirect_to gossip_path(@gossip.id)
		
	end


	def edit

		@gossip = Gossip.find(params[:id])
		
	end

	def update
		
		@gossip = Gossip.find(params[:id])

		if@gossip = Gossip.update(gossip_params) #On a créer une fonction privée (cf en bas) qui va chercher els paramètres de gossip :anonymous_author et :content
			redirect_to gossip_path #(@gossip.id)  #@gossip
		else
			render 'edit'
		end
	end

	def destroy
		
		@gossip = Gossip.find(params[:id])

		@gossip.destroy #On a créer une fonction privée (cf en bas) qui va chercher els paramètres de gossip :anonymous_author et :content

		redirect_to gossips_path

	end

	private

	def gossip_params

		params.require(:gossip).permit(:anonymous_author, :content)
		
	end

end
