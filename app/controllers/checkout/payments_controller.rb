class Checkout::PaymentsController < ApplicationController

	def create
	  
	  #Email: c05023843764745297802@sandbox.pagseguro.com.br
	  #Senha: GdcV3987GjDwpV6u
	  #cartao: 4111111111111111
	  #Bandeira: visa
      #Valido: 12/2030
	  #CVV:123



	  ad = Ad.find(params[:ad_id])
	  #passando status do ad de active para processing
	  ad.processing!

	  order = Order.create(ad: ad, buyer_id: current_member.id )

	  order.waiting!

	  payment = PagSeguro::PaymentRequest.new

	  payment.reference = order.id
	  payment.notification_url = checkout_notifications_url #fix later
	  payment.redirect_url = site_ad_detail_url(ad)

	  payment.items << { 
	  	id: ad.id,
	  	description: ad.title,
	  	amount: ad.price.to_s.gsub(',', '.')
	  }

	  response = payment.register

	  if response.errors.any?
	  	redirect_to site_ad_detail_path(ad), alert: "Erro ao processar compra... Entre em contato com o SAC (21) 2222-2222"
	  else
	  	redirect_to response.url
	  end
	end
end
