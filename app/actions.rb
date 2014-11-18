# Homepage (Root path)
enable :sessions

helpers do
  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end
end 

get '/' do
  erb :index
  redirect '/login'
end

get '/login' do
  erb :login
end

post '/login' do
  @user = User.where(email: params[:email], password: params[:password]).first
  if @user
    session[:user_id] = @user.id
    redirect '/songs'
  else
    @error = true
    erb :login
  end
end

get '/logout' do
  session.clear
  redirect '/songs'
end

get '/register' do
  erb :register
end

post '/register' do
  @user = User.new(
    first_name: params[:first_name],
    last_name: params[:last_name],
    email: params[:email],
    password: params[:password]
    )
  if @user.save
    session[:user_id] = @user.id
    redirect '/songs'
  else
    erb :register
  end
end

get '/songs' do
  @songs = Song.all
  erb :'songs/index'
end

get '/songs/new' do
  @song = Song.new
  erb :'songs/new'
end

get '/songs/:id' do
  @song = Song.find params[:id]
  erb :'songs/show'
end

post '/songs/new' do
  @song = Song.new(
    title: params[:title],
    author: params[:author],
    url: params[:url],
    user_id: current_user.id
    ) 
  if @song.save
    redirect '/songs'
  else
    erb :'songs/new'
  end
end

post '/songs' do
  binding.pry
  @song = Song.find(params[:song_id].to_i)
  @vote = Vote.where(user_id: current_user.id, song_id: @song.id).first
  if @vote
    @error = true
    @songs = Song.all
    erb :'songs/index'
  else
    Vote.create(user_id: current_user.id, song_id: @song.id, total_votes: params[:vote])
    redirect '/songs'
  end
end

