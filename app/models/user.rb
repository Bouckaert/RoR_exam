class User

  include Mongoid::Document

  field :uid
  field :name
  field :login
  field :email
  field :token
  
  attr_accessor :email, :login, :name, :token, :uid

  def self.create_with_omniauth(auth)
  	p 'create'
  	p User.all
  	user = User.new
	user.create(uid: auth["uid"], name: auth["info"]["name"], login: auth["info"]["login"], email: auth["info"]["email"], token: auth["credentials"]["token"]  )
  end
end