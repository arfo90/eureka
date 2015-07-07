
class Save_temp
   attr_accessor :data
   
   def initialize
     @data = {}
   end

   def insert(temp_data)
     @data = temp_data
   end   
end
