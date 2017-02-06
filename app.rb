require 'sinatra'
require 'json'


get '/' do
  erb :index
end

post '/auth' do
  content_type :json
  resp = { status: "Fail", message: "You've not authenticated"}
  if params[:secret]
    resp = { status: "OK", message: "You've authenticated", "token": params[:secret]}
  end
  resp.to_json
end

get '/boobies' do
  erb :elf
end

get '/searchphone/:phone/:secret' do
  if params[:secret].nil?
    redirect to("/")
  end
  
  content_type :json
  phone_num = params[:phone]
  debt = (phone_num.to_i)%100
  { name: "Ziya Bayramov", number: phone_num, debt: debt }.to_json
end



get '/bills' do
  erb :citizen_inp
end

get '/foo' do
  erb :makandra
end
