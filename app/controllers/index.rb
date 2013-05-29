get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/note/create' do
  erb :note_create
end

get '/notes' do
  @notes = Note.all
  erb :notes
end

post '/create' do
  @note = Note.create(title: params[:title], content: params[:content])
  redirect '/notes'
end

get '/note/edit/:note_id' do
  @note = Note.find(params[:note_id])
  erb :note_edit
end

get '/edit' do
  Note.find(params[:note_id]).update_attributes(title: params[:title], content: params[:content])
  redirect '/notes'
end

get '/confirm_delete/:note_id' do
  @note = Note.find(params[:note_id])
  erb :confirm_delete
end

post '/delete' do
  if params[:submit] == 'Delete'
    Note.destroy(params[:note_id])
  end
  redirect '/notes'
end


