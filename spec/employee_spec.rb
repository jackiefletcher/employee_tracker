require('spec_helper')

describe(Employee) do
  it("tells which division the employee belongs to") do
    division = Division.create({:name => "Tacos"})
    employee = Employee.create({:name => "Betty", :division_id => division.id})
    expect(employee.division()).to(eq(division))
  end
end
