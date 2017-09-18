class Test < ApplicationRecord
	has_many :test_question
	has_many :questions, through: :test_question
end
