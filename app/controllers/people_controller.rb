class PeopleController < ApplicationController

	def create
		# byebug
		person = Person.new(user_params)
		 if person.save
		 	render json: {id: person.id, name: person.name, favoriteCity: person.favoriteCity}
		 else
		 	render json: {error: 'sorry, user cannot be saved'}
		 end
	end

	def show
		person = Person.find_by_id(self.params["id"].to_i)
		# byebug
		if person
			render json: {id: person.id, name: person.name, favoriteCity: person.favoriteCity}
		else
			render json: {error: 'sorry, that user cannot be found'}

			# json { render :json => @key.errors, :status => 422 }
		end
	end

	def index
		all_people = Person.all
		# byebug
		render json: {people: all_people}
	end

	def update
		# byebug
		person = Person.find_by_id(user_params["id"])
		person.favoriteCity = params["update"]
		if person.save
			# byebug
			render json: {id: person.id, name: person.name, favoriteCity: person.favoriteCity}
		else
			render json: {error: 'sorry, that user cannot be updated'}
		# byebug
		end
	end

	def destroy
		# byebug
		if Person.find_by_id(self.params["id"].to_i)
			Person.find(self.params["id"].to_i).destroy
			render json: { deleteNote: 'success' }
		else
			render json: {error: 'sorry, that user does not exist'}
		end
	end

	private

	def user_params
    # this is strong params
    # byebug
    params.require(:person).permit(:id, :name, :favoriteCity)
    end

end