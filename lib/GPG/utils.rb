require 'open3'
class Utils
	def self.run_command(command)
		stdout, status = Open3.capture2(command)
	end
end