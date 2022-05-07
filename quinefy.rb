# Attempt 1, to understand what is going on
# lines = [
#   "lines = [",
#   "__PRINT_OWN_SOURCE_CODE__",
#   "]",
#   "",
#   "lines.each do |line|",
#   "  if line == '__PRINT_OWN_SOURCE_CODE__'",
#   "    lines.each { |l| puts '  ' << l.inspect << ',' }",
#   "  else",
#   "    puts line",
#   "  end",
#   "end",
# ]
# lines.each do |line|
#   if line == '__PRINT_OWN_SOURCE_CODE__'
#     lines.each { |l| puts '  ' << l.inspect << ',' }
#   else
#     puts line
#   end
# end

# After more reading online
def s; "def s;;end;puts s()[0, 6]+34.chr + s + 34.chr + s()[6, s.length-6]"; end; 
puts s()[0, 6] + 34.chr + s + 34.chr + s()[6, s.length - 6]
