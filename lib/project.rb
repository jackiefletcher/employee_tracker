class Project < ActiveRecord::Base
  has_and_belongs_to_many(:employees)

  scope(:not_done, -> do
    where({:done => false})
  end)

  scope(:done, -> do
    where({:done => true})
  end)

end
