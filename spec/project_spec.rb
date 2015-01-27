require('spec_helper')

describe(Project) do
  # it("tells which employee it belongs to")do
  #   employee = Employee.create({:name => "Jonny", :division_id => 1})
  #   project1 = Project.create({:name => "Fry the shells", :done => false, :employee_id => employee.id})
  #   expect(project1.employee()).to(eq(employee))
  # end

  describe('.not_done') do
    it("returns the projects that are not done") do
      employee = Employee.create({:name => "Georgio", :division_id => 1})
      not_done_project1 = Project.create({:name => "Sweep the floors", :employee_id => employee.id, :done => false})
      not_done_project2 = Project.create({:name => "Mop the floors", :employee_id => employee.id, :done => false})
      not_done_projects = [not_done_project1, not_done_project2]
      done_project = Project.create({:name => "Sweep the floors", :employee_id => employee.id, :done => true})
      expect(Project.not_done()).to(eq(not_done_projects))
    end
  end

  describe('.done') do
    it("returns the projects that are done") do
      employee = Employee.create({:name => "Georgio", :division_id => 1})
      not_done_project1 = Project.create({:name => "Sweep the floors", :employee_id => employee.id, :done => false})
      done_project1 = Project.create({:name => "Sweep the floors", :employee_id => employee.id, :done => true})
      done_project2 = Project.create({:name => "Mop the floors", :employee_id => employee.id, :done => true})
      done_projects = [done_project1, done_project2]
      expect(Project.done()).to(eq(done_projects))
    end
  end

  it("adds a project to multiple employees") do
    employee1 = Employee.create({:name => "Jonny", :division_id => 1})
    employee2 = Employee.create({:name => "Jimmy", :division_id => 1})
    project1 = Project.create({:name => "Fry the shells", :done => "false", :employee_ids => [employee1.id, employee2.id]})
    # employee2.update(:project_ids => [project1.id])
    expect(project1.employees()).to(eq([employee1, employee2]))
  end

end
