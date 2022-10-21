class ApplicationController < ActionController::Base

  def blank_square_form
    render ({ :template => "calculation_templates/square_form.html.erb"})
  end

  def calculate_square
    @num = params.fetch("number").to_f
    @square_of_num = @num ** 2
    render ({ :template => "calculation_templates/square_results.html.erb"})
  end


  def blank_rand_form
    render ({ :template => "calculation_templates/rand_form.html.erb"})
  end

  def calculate_random
    @lower = params.fetch("user_min").to_f
    @upper = params.fetch("user_max").to_f
    @result = rand(@lower..@upper)

    render ({ :template => "calculation_templates/rand_results.html.erb"})
  end


  def blank_square_root_form
    render ({ :template => "calculation_templates/root_form.html.erb"})
  end

  def calculate_square_root
    @num = params.fetch("user_number").to_f
    @square_root_of_num = @num ** (1/2.0)

    render ({ :template => "calculation_templates/root_results.html.erb" })
  end


  def blank_payment_form
    render ({ :template => "calculation_templates/payment_form.html.erb" })
  end

  def calculate_payment
    apr = params.fetch("apr").to_f.round(4)
    @apr = apr.to_s( :percentage, { :precision => 4 })

    num_years = params.fetch("num_years").to_i
    @num_years = num_years

    principal = params.fetch("principal").to_f
    @principal = principal.to_s(:currency, { :precision => 2 })

    monthly_interest = apr / 100 / 12
    numerator =  monthly_interest * principal
    denominator = 1 - (1 + monthly_interest) ** -(num_years * 12)
    payment = numerator / denominator
    
    @payment = payment.to_s(:currency, { :precision => 2 })

    
    render ({ :template => "calculation_templates/payment_results.html.erb" })
  end


end
