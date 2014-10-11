class Cabin < ActiveRecord::Base
    has_many :people
    
    validates_presence_of :name, :gender
    validates_uniqueness_of :name
end