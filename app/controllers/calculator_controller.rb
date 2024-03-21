class CalculatorController < ApplicationController
    def calculator_form
    end

    def add_numbers
        numbers = params[:numbers]
        begin
            result = Calculator.add(numbers)
            render json: { result: result }, status: :ok
        rescue StringCalculator::Errors::NegativeNumberFound => e
            render json: { error: e.message }, status: :unprocessable_entity
        rescue StringCalculator::Errors::InvalidNumber => e
            render json: { error: e.message }, status: :unprocessable_entity
        end
    end
end
