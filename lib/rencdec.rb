require 'radix'

def rencdec(params)
	current_encoding, target_encoding, current_data = params[:current_encoding], params[:target_encoding], params[:current_data]
	current_base = Radix::Base.new current_encoding
	target_base = Radix::Base.new target_encoding
	target_data = target_base.convert current_data.join, current_base
	puts "verified" if current_data == current_base.convert(target_data, target_base).chars.map(&:to_sym)
	target_data
end

puts rencdec(current_data: [:h,:e,:l,:l,:o],
		current_encoding: [:a,:b,:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m,:n,:o,:p,:q,:r,:s,:t,:u,:v,:w,:x,:y,:z],
		target_encoding: 0..9)
puts rencdec(current_data: [:q,:u,:e,:r,:t,:y], current_encoding: [:e,:q,:r,:t,:u,:y], target_encoding: [:a,:b,:c,:d])