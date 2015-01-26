class CreateTables < ActiveRecord::Migration
  def change
    create_table(:employees) do |t|
      t.column(:name, :string)
      t.column(:division_id, :integer)
    end

    create_table(:divisions) do |t|
      t.column(:name, :string)
    end
  end
end
