class TestsController < ApplicationController
	def new
		@test = Test.new
	end
	def show
		 @test = Test.find(params[:id])
	end
	def index
		@tests = Test.all
	end
	def create
		 @test = Test.new(test_params)
           if @test.save
              redirect_to @test
          else
          	render 'new'
          end
	end

	private
      def test_params
       params.require(:test).permit(:name)
      end
end
