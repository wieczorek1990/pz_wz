@current_number = 'fdsa'
@date = 'fdsa'
@supplier = 'fdsa'
@vehicle_number = 'fdsa'
@humidity = '1'
@contamination = '2'
@commodity = 'rzepak'
@quanity_gross = '324'
@quanity_tare = '43'
@quanity_net = '432'
i = ARGV[0]
o = ARGV[1]
tmp = 'tmp'

require 'securerandom'
f = File.new(i, 'r')
c = f.read
f.close
c.gsub!('\current_number', @current_number)
c.gsub!('\date', @date)
c.gsub!('\supplier', @supplier)
c.gsub!('\vehicle_number', @vehicle_number)
c.gsub!('\humidity', @humidity)
c.gsub!('\contamination', @contamination)
c.gsub!('\commodity', @commodity)
c.gsub!('\quanity_gross', @quanity_gross)
c.gsub!('\quanity_tare', @quanity_tare)
c.gsub!('\quanity_net', @quanity_net)
p = SecureRandom.hex + '.tex'
tp = tmp + '/' + p
f = File.new(tp, 'w')
f.write(c)
f.close
system("cd #{tmp}; pdflatex #{p}; cd -; mv #{tp} #{o}")
