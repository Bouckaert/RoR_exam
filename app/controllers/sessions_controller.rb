class SessionsController < ApplicationController

  def create
    # Busca ou cria usuário baseado no UID.
    p '------------------------'
    p auth_hash

    if User.find_by(uid: auth_hash['uid']).present?
    	p 'in'
    	user = User.find_by(uid: auth_hash['uid']) 
    else
    	p 'else'
    	user = User.create_with_omniauth(auth_hash)
	end

    Rails.logger.info "Adding #{user.uid} to the session[:user_id]"
    session[:user_id] = user.uid

    # Redireciona para URL da aplicação
    redirect_to sessions_index_path
  end

  def index
  	@user = User.find_by(uid: session[:user_id])
  	p session[:user_id]
  	p @user
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end
