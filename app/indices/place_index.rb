#ThinkingSphinx::Index.define :place, :with => :active_record do
#  indexes name, address, phone
#  has "RADIANS(`places`.`latitude`)", as: :latitude, type: :float
#  has "RADIANS(`places`.`longitude`)", as: :longitude, type: :float
#end