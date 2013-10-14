require 'yaml/store'

class Idea
	
	attr_reader :title, :description

	def all
		Idea.all
	end

	def initialize(attributes = {})
  		@title = attributes["title"]
  		@description = attributes["description"]
	end

	def save
		database.transaction do |db|
			db['ideas'] ||= []
			database['ideas'] << {"title" => title, "description" => description}
		end
	end

	def database
		Idea.database
	end

	
end

