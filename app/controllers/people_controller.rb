class PeopleController < ApplicationController
	
	# the Create of CRUD
	def create
		person = Person.new(user_params)
		 if person.save
		 	render json: {id: person.id, name: person.name, favoriteCity: person.favoriteCity}, status: 201
		 else
		 	render body: 'Person could not be created', status: 404
		 end
	end

	# the Read of CRUD
	def show
		person = Person.find_by_id(self.params["id"].to_i)
		if person
			render json: {id: person.id, name: person.name, favoriteCity: person.favoriteCity}
		else
			render body: 'Person Not Found', status: 404
		end
	end

	# the Read of CRUD
	def index
		all_people = Person.all
		if all_people
			render json: {people: all_people}
		else
			render body: 'People Not Found', status: 404
		end
	end

	# the Update of CRUD
	def update
		person = Person.find_by_id(user_params["id"])
		if person
			person.favoriteCity = params["update"]
			if person.save
				render json: {id: person.id, name: person.name, favoriteCity: person.favoriteCity}
			else
				render body: 'Person Invalid', status: 404
			end
		else
			render body: 'Person Not Found', status: 404
		end
	end

	# the Destroy of CRUD
	def destroy
		person = Person.find_by_id(self.params["id"].to_i)
		if person
			person.destroy
			render body: 'Person Destroyed', status: 204
		else
			render body: 'Person Not Found', status: 404
		end
	end

	private

	def user_params
    	params.require(:person).permit(:id, :name, :favoriteCity)
    end

end