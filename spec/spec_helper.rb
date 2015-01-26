require('rspec')
require('sinatra/activerecord')
require('division')
require('employee')
require('pg')


RSpec.configure do |config|
  config.after(:each) do
    Employee.all().each() do |employee|
      employee.destroy()
    end
  end  
end
