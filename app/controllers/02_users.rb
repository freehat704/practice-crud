get '/login' do
  if current_user
    redirect to("/users/#{@user.id}")
  end
  erb :"users/login"
end

get '/users/new' do
  erb :"users/new"
end

get '/users/:id' do
	if current_user && current_user.id == params[:id].to_i
		@user = User.where(id: params[:id]).first
		erb :'/users/show'
	else
		redirect to('/')
	end
end

get '/logout' do
  session.clear
  redirect to('/')
end

post '/users/new' do
  data = params[:user]
  user = User.new(params[:user])
  if user.valid?
    user.save
    session[:user] = user.email
    redirect to("/users/#{@user.id}")
  else
    @errors = user.errors.full_messages
    @name = data[:fullname]
    @email = data[:email]
    erb :signup
  end
end

post '/login' do
  data = params[:user]
  user = User.find_by_email(data[:email]).try(:authenticate, data[:password]) 
  if user
    session[:user] = user.email
    redirect to("/users/#{user.id}")
  else
    @error = "Login unsuccessful"
    erb :"users/login"
  end
end