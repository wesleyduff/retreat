class Person < ActiveRecord::Base
    belongs_to :cabin
    belongs_to :role
    
    validates_presence_of :lastname, :firstname, :gender, :age
end
