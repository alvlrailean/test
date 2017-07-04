require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'sinatra/activerecord'


set :database, "sqlite3:spareshop.db"

class Spare < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	validates :price, presence: true
	validates :link, presence: true
	# validates :description, presence: true

end



before do
	@pice = Spare.all
	
end 

get '/' do 
	
	erb :index
end

get '/details' do
	
	erb :details
end

get '/spare/:id' do

	@spare = Spare.find params[:id]

	erb :spare
end


post '/' do

	@spare = Spare.new params[:spares]
	@spare.save

	if @spare.save
		erb :details
	else
		@error = @spare.errors.full_messages[0]
		erb :index
	end
end

post '/details' do
	erb :details
end