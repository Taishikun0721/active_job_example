class UserMailer < ApplicationMailer

  def welcome
    @name = params[:name]
    token = SecureRandom.uuid
    mail(to: params[:email], subject: '登録完了です')
  end
end
