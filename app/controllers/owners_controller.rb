class OwnersController < ApplicationController

  get '/owners' do
    @owners = Owner.all
    erb :'/owners/index'
  end

  get '/owners/new' do
    @pets = Pet.all
    erb :'/owners/new'
  end

  post '/owners' do
    @owner = Owner.create(owner_params)

    if !params["pet"]["name"].empty?
      @owner.pets << Pet.create(params[:pet])
    end

    redirect "/owners/#{@owner.id}"
  end

  get '/owners/:id/edit' do
    @owner = Owner.find(params[:id])
    erb :'/owners/edit'
  end

  get '/owners/:id' do
    @owner = Owner.find(params[:id])
    erb :'/owners/show'
  end

  post '/owners/:id' do
    @owner = Owner.find(params[:id])
    @owner.update(owner_params)

    if !params["pet"]["name"].empty?
      @owner.pets << Pet.create(params[:pet])
    end

    redirect "/owners/#{@owner.id}"
  end

  private

  def owner_params
    params[:owner]
  end
end
