require 'gpg'

#Commands.export_private("mameade@utica.edu", output=nil)
#Key.list_keys
#Commands.sign_file("mameade@utica.edu","order.php")
#Commands.verfiy("order.php.gpg")
#Commands.sign_file("mameade@utica.edu", "order.php")
#encrypt_file("mameade@utica.edu", "order.php")
Commands.encrypt_file("BirdFart", "main.rb")

#Commands.sign_encrypt("mameade@utica.edu", "mameade@utica.edu", "derby3333", "order.php")
#Keys.import("import.gpg")