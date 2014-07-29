get '/tags/:id' do
  @tag = Tag.where(id: params[:id]).first
  @posts = @tag.posts
  erb :"posts/show"
end