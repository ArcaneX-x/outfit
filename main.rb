require_relative 'lib/outfit'
require_relative 'lib/wardrobe'
require 'byebug'

wardrobe = Wardrobe.from_dir(File.join(__dir__, 'data'))

puts "Давайдет подберем вам гардероб."
puts "Какая сейчас температура?"

temperature = STDIN.gets.to_i

recomendation = wardrobe.outfit(temperature)

if recomendation.empty?
  puts "Извините, ничего не нашлось."
else
  puts "\nПредлагаем надеть:\n\n"
  recomendation.each { |i| puts i }
end


