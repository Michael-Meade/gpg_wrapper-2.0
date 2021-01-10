require_relative '../gpg'
class FingerPrint
	def self.get_fingerprint_file(file_path, id=nil)
		if id.nil?
			Utils.run_command("gpg --with-fingerprint #{file_path}")
		elsif id.to_s == "id"
			Utils.run_command("gpg --with-fingerprint #{file_path}").to_s.split("=")[1]
		end
	end
	def self.encrypt_with_fingerprint(fingerprint, file)
		# Encrypts file with users public key. uses fingerprint to find public key
		Utils.run_command(%Q(gpg --yes --always-trust -e -r "#{fingerprint.strip}" -a  #{file}))
	end
	def self.list_fingerprints
		Utils.run_command("gpg --fingerprint")
	end
end
