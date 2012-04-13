require 'radix'

class Rencdec
	attr_reader :verbose, :current_encoding, :target_encoding, :current_data, :current_radix, :target_radix, :target_data
	def initialize(params)
		@current_encoding, @target_encoding, @current_data = params[:current_encoding], params[:target_encoding], params[:current_data]

		@current_radix = Radix::Base.new current_encoding
		@target_radix = Radix::Base.new target_encoding
	end
	def encode
		tmp_current = current_data.map{|c| current_radix.values[c.to_s]}
		tmp_target = Radix.convert_base(tmp_current, current_radix.base, target_radix.base)
		@target_data ||= tmp_target.map{|t| target_radix.values.invert[t]}
	end
	def decode
		tmp_target = target_data.map{|t| target_radix.values[t.to_s]}
		tmp_current = Radix.convert_base(tmp_target, target_radix.base, current_radix.base)
		@current_data ||= tmp_current.map{|t| current_radix.values.invert[t]}
	end
	def verify
		encode == target_data && decode == current_data
	end
end