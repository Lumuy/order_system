class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def notification_email
    @user  = params[:user]
    @order = params[:order]
    mail(to: @user.email, subject: 'Order status changed')
  end
end
