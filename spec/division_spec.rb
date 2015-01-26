require('spec_helper')

describe(Division) do
  it("tells which employees belong in a division") do
    division = Division.create({:name => "Tacos"})
    employee1 = Employee.create({:name => "Jonny", :division_id => division.id})
    employee2 = Employee.create({:name => "Janey", :division_id => division.id})
    expect(division.employees()).to(eq([employee1, employee2]))
  end

end
