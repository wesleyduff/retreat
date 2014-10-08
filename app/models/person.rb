class Person < ActiveRecord::Base
    belongs_to :cabin
    belongs_to :role
end
