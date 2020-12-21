require 'open3'
class CMD
    def run(cmd)
        stdout, status = Open3.capture3(cmd)
    end
end
class Import < CMD
    def import_key(file)
        run("gpg --import #{file}")
    end
end
class Encrypt < CMD
    def encrypt_msg(text_to_encrypt, pubkey_name)
        run("echo '#{text_to_encrypt}' | gpg  --encrypt -a -r '#{pubkey_name}' --always-trust")
    end
    def encrypt_file(file_to_encrypt, pubkey_path)
        fprint = Utils.new.get_fingerprint(pubkey_path)
        run("cat '#{file_to_encrypt}' | gpg  --encrypt -a -r '#{fprint}' --always-trust")
    end
end
class Sign < CMD
    # note: its not a good idea to hard code your pass. 
    def sign_msg(pass, pubkey_name, file)
        run("echo '#{pass}' | gpg --batch --yes --passphrase-fd 0 --local-user #{pubkey_name} --sign #{file}")
    end
end
class Utils < CMD
    def get_fingerprint(file_path)
        output = run("gpg --with-fingerprint #{file_path}").shift
     output.to_s.split("Key fingerprint =")[1].to_s.split("sub")[0].strip
    end
end
class Export < CMD
    def export_public(pubkey_name, file_name = nil)
        if file_name.nil?
            run("gpg --armor --export #{pubkey_name} > #{filename}")
        else
            run("gpg --armor --export #{pubkey_name}")
        end
    end
end



puts ""
# Import key
#Import.new.import_key("t.txt")

# Encrypt text
#puts Encrypt.new.encrypt_msg("Hi", "") 

puts Encrypt.new.encrypt_file("rakefile.rb", "t.txt")
# Export Public key
#puts Export.new.export_public("")


#puts Utils.new.get_fingerprint("t.txt")