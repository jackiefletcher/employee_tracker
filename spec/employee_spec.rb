require('spec_helper')

describe(Employee) do
  it("tells which division the employee belongs to") do
    division = Division.create({:name => "Tacos"})
    employee = Employee.create({:name => "Betty", :division_id => division.id})
    expect(employee.division()).to(eq(division))
  end

  it("tells which projects belong to an employee") do
    employee = Employee.create({:name => "Jonny", :division_id => 1})
    project1 = Project.create({:name => "Fry the shells", :done => "false", :employee_id => employee.id})
    project2 = Project.create({:name => "Shred the lettuce", :done => "false", :employee_id => employee.id})
    expect(employee.projects()).to(eq([project1, project2]))
  end
end
