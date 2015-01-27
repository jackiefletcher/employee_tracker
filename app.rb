require('sinatra')
require('sinatra/reloader')
also_reload('/lib/**/*.rb')
require("sinatra/activerecord")
require('./lib/employee')
require('./lib/division')
require('./lib/project')
require('pg')

get('/') do
  @divisions = Division.all()
  @employees = Employee.all()
  erb(:index)
end

post('/divisions') do
  name = params.fetch('name')
  @division = Division.new({:name => name})
  @division.save()
  @divisions = Division.all()
  @employees = Employee.all()
  erb(:index)
end

get('/divisions/:id') do
    @division = Division.find(params.fetch('id').to_i())
    erb(:divisions)
end

post('/employees') do
  name = params.fetch('name')
  division_id = params.fetch('division_id').to_i()
  @employee = Employee.create({:name =>name, :division_id => division_id })
  # @employee.save()
  redirect("/")
end

post('/projects') do
  name = params.fetch('name')
  employee_id = params.fetch('employee_id').to_i()
  project = Project.create({:name => name, :done => false})
  redirect('/')
end

post('/group_projects') do
  name = params.fetch('name')
  employee_id = params.fetch('employee_id').to_i()
  employee2_id = params.fetch('employee_id2').to_i()
  project = Project.create({:name => name, :done => false, :employee_ids => [employee_id, employee2_id]})
  # employee1 = Employee.find(employee_id)
  # employee2 = Employee.find(employee2_id)
  # employees = [employee1, employee2]
  # project.update({:employee_id => employees})
  redirect('/')
end


get('/projects/:id') do
  @project = Project.find(params.fetch('id').to_i())
  erb(:project)
end

patch('/project/edit_name/:id') do
  name = params.fetch('name')
  @project = Project.find(params.fetch("id").to_i())
  @project.update({:name => name})
  redirect('/')
end

patch('/project/edit_done/:id') do
  done = params.fetch('done')
  @project = Project.find(params.fetch("id").to_i())
  @project.update({:done => done})
  redirect('/')
end
