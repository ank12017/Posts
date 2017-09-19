class TestquestionsController < ApplicationController
	def new 
		@testquestion = Testquestion.new
    end
    def index
    	@testquestions = Testquestion.all
    end

		
	
end
