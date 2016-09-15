class MessageMailer < ApplicationMailer
	default from:"sugusc21@gmail.com"

	def mailmessages(id, message)
  		@message = Message.find(id)
  		mail to:"agustin_casal@yahoo.com.ar", subject: @message.title
	end

	def mailmess(email_envio)
  		@mess = "El Equipo de Swoptcha"
  		mail to: email_envio, subject: "Hito de Proyecto finaliza el día de mañana"
	end
end
