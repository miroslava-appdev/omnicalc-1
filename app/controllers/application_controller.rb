class ApplicationController < ActionController::Base
  #square

  def blank_square_form
    render({ :template => "calculation_templates/square_form.html.erb" })
  end

  def calculate_square
    @num = params.fetch("number").to_f
    @square_of_num = @num ** 2
    render({ :template => "calculation_templates/square_results.html.erb" })
  end

  #square root

  def blank_square_root_form
    render({ :template => "calculation_templates/square_root_form.html.erb" })
  end

  def calculate_square_root
    @num = params.fetch("user_number").to_f
    @result = Math.sqrt(@num)
    render({ :template => "calculation_templates/square_root_results.html.erb" })
  end 

  #payment
  def blank_payment_form
    render({ :template => "calculation_templates/payment_form.html.erb" })
  end

  def calculate_payment
    @num_apr = params.fetch("user_apr").to_s(:percentage, { :precision => 4 })

    @num_years = params.fetch("user_years").to_i

    @num_principal = params.fetch("user_principal").to_s(:currency)

    @apr_per_period = (@num_apr/100)/12

    @monthly_payment = ((@apr_per_period * @num_principal) / (1 - (1 + @apr_per_period) ** -12)).to_s(:currency, { :precision => 2 })

    render({ :template => "calculation_templates/payment_results.html.erb" })
  end

  #random

  def blank_random_form
    render({ :template => "calculation_templates/rand_form.html.erb" })
  end

  def calculate_random
    @lower = params.fetch("user_min").to_f
    @upper = params.fetch("user_max").to_f
    @result = rand(@lower..@upper)
    render({ :template => "calculation_templates/rand_results.html.erb" })
  end
end
