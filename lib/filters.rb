#   def build_response
#     print  "----building response..."
#   end
# 
#   def self.call_before_all_methods
#     class_eval <<-END
#     alias :original_index :index
#     def index
#       original_index
#       build_response
#     end
#     # remove_method "original_index".to_sym
#     # class.send :remove_method, :original_index
#     END
#   end
# 
#   private_class_method :call_before_all_methods
#   call_before_all_methods
# end
# 
# 





# 
# class Filter
# def index
#   p " i am in index"
#   another_method
#   
# end  
# 
# 
# def build_response
#   "building response..."
# end
# 
#   
# def self.call_before_all_methods
#   # all_instance_methods = instance_methods - Class.instance_methods
# #   all_instance_methods.each do |x|
# #     class_eval <<-END
# #       alias original_#{x} #{x}
# #       def #{x}
# #         
# #         p "before action from #{x.to_s}"
# #         original_#{x}
# #         p "after action from #{x.to_s}"
# #         
# #       end
# #       
# #       # remove_method original_#{x}.to_sym
# #     END
# 
#   
#   class_eval <<-END
#         alias :original_index :index
#         def index
#           original_index
#           build_response
#         end
#          # remove_method "original_index".to_sym
#          # class.send :remove_method, :original_index
#       END
#       
# 
#   # class_exec do
#   #       alias_method :original_index, :index
#   #       def index
#   #         original_index
#   #         build_response
#   #       end
#   #       class.send :remove_method, :original_index
#   #     end
#   
#   end
# 
# 
#   
# private_class_method :call_before_all_methods
# call_before_all_methods
# 
#   end
#   
# filter = Filter.new
# p filter.index
