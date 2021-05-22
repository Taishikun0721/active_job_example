class WelcomesController < ApplicationController
  def create
    logger.info 'これからメールを送信します'
    UserMailer.with(email: params[:email], name: params[:name]).welcome.deliver_later
    head :ok
  end
end
