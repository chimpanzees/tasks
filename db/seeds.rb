adam = User.new(:first_name => "Adam", :last_name => "Cooke", :email_address => "adam@atechmedia.com")
adam.username = 'adam'
adam.save

dan = User.new(:first_name => "Dan", :last_name => "Wentworth", :email_address => "dan@atechmedia.com")
dan.username = 'dan'
dan.save

jack = User.new(:first_name => "Jack", :last_name => "Hayter", :email_address => "jackh@atechmedia.com")
jack.username = 'jack'
jack.save
