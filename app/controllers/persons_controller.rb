require 'open-uri'

class PersonsController < ApplicationController
  before_action :set_persons, only: [:show, :update, :destroy]

  # GET /users
  def index
    @persons = Person.all
    render json: @persons.to_json(include: [:person_chars, :photos])
  end

  def show
    render json: @person
  end

  # POST
  def create
    @person = Person.new(person_params)
    if @person.save
      doc = Nokogiri::HTML(open("https://websta.me/n/#{@person.ig}")) #get HTML
      i = 0
      doc.css(".list-img img").each do |node| #iterate through each image on feed
        break if i == 11 #stop after 20 images
        Photo.create(person: @person, url: node.attribute("src").value) #create photo objects for each photo, set up relationship
        i += 1
      end
      # TODO - iterate over person_chars in the params and create a PersonChar for each
      # puts person_char_params
      render json: @person.to_json(include: [:person_chars, :photos]), status: :created, person: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    @person = Person.find(params[:id])
    @person.update(person_params)
    if @person.save
      render json: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @char.destroy
  end

  private

  def person_params
    params.require(:person).permit(:name, :ig, :fit)
  end

  # def person_char_params
  #   params.require(:person).permit(:person_chars)
  # end
end
