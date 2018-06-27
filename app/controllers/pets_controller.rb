class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index'
  end

  get '/pets/new' do
    @owners = Owner.all
    erb :'/pets/new'
  end

  post '/pets' do
    @pet = Pet.create(pet_params)

    if !params[:owner][:name].empty?
      @pet.owner = Owner.create(params[:owner])
      @pet.save
    end

    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  post '/pets/:id' do
    @pet = Pet.find(params[:id])
    @pet.update(pet_params)

    if !params[:owner][:name].empty?
      @pet.owner = Owner.create(params[:owner])
      @pet.save
    end

    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id/edit' do
    @pet = Pet.find(params[:id])
    erb :'/pets/edit'
  end

  private

  def pet_params
    params[:pet]
  end
end
