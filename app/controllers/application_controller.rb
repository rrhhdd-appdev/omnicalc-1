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

end
