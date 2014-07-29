get '/posts' do
  @posts = Post.all
  erb :"posts/show"
end

get '/posts/new' do
  if current_user
    @post = Post.new
    @tag = Tag.new
    erb :"posts/new"
  else
    redirect to('/login')
  end
end

get '/posts/:id' do
  @posts = Post.where(id: params[:id])
  erb :"posts/show"
end

get '/posts/:id/edit' do
  @post = Post.find(params[:id])
  @tags = @post.tags
  erb :"posts/edit"
end

get '/posts/:id/delete' do
  @post = Post.find(params[:id])
  erb :"posts/delete"
end

post '/posts' do
  new_post = Post.create(params[:post])
  new_post.user = current_user
  tag_string = params[:tag][:tag_name]
  tagging = tag_array(tag_string)
  tag_appender(tagging, new_post)
  redirect to("/posts/#{new_post.id}")
end

put '/posts/:id/edit' do
  data = params[:post]
  post = Post.find(params[:id])
  post.update(title: data[:title], body: data[:body])
  tag = Tag.find_by_name data[:tag_name]
  post.tags.clear
  post.tags << tag
  redirect to ("/posts/#{post.id}")
end

delete '/posts/:id/delete' do
  @user = current_user
  if params[:yes]
    Post.delete(params[:id])
  end
  redirect to("/users/#{@user.id}")
end