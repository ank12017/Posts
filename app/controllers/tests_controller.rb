class TestsController < ApplicationController
	def new
		@test = Test.new
	end
	def show
		 @test = Test.find(params[:id])
	end
	def index
		@test = Test.all
	end
	def create
		 @test = Test.new(params[:test])
           if @test.save
              redirect_to @test
          else
          	render 'new'
          end
	end

	private
      def test_params
       params.require(:test).permit(:text)
      end
end
