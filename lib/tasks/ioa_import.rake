


namespace :ioa do

    desc "Clean out recent users"
    task :clean_users => :environment do
       User.all.each {|u| u.destroy if u.created_at.to_date == Date.today}
    end
    
    desc "Load users from a csv file"
    task :load_csv => :environment do

    require 'fastercsv'
    require 'lib/random'

    @env = RAILS_ENV

    @help_text = "
      HELP        - Usage: HELP=true
                  Displays this helpful information!

      ENV   - Usage: ENV=environment
                  Where environment is one of: development, production, test, etc
                  Default: none (required)

      FILE - Usage: FILE=/foo/bar/eek.csv
                  file to load

      VERBOSE     - Usage: VERBOSE=true
                  Sets verbosity of output
                  Default: false (if not provided)

      RUN         - Usage: RUN=true
                  Actually run the commands (otherwise they are displayed only)
                  Default: true (if not provided)
                  "  

      @verbose = ( ENV['VERBOSE'] && ENV['VERBOSE'] == 'true')
      @run = !( ENV['RUN'] && ENV['RUN'] == 'false')

      # output HELP in man cases, or if env is not specified
      puts @help_text and abort if (ENV['HELP'] || !@env)

      csv_file = ENV['FILE']
      puts @help_text and abort if csv_file.blank?

      puts "csv file not found" and abort unless File.exists?(csv_file)
      
      created_count = dup_count = err_count = 0
      


      newusers = FasterCSV.read(csv_file) 
      puts "Loaded #{newusers.length} records from #{csv_file}"
      puts "reading..."
      newusers.each do |newuser|
        bitfield = newuser[0]
        phonefield = newuser[1]
        email = newuser[2]
        fullname = newuser[3]
        addressfield = newuser[4]
        
        
        # new user
        u = User.new
        
        # keep the bitfiled in the identity_url field, for now
        u.identity_url = bitfield
        
        # populate phone fields
        phones = email.split(' ')
        u.phone = phones.first
        u.phone2 = phones.second
        
        # populate email field, skip if already loaded
        #u.email = email
        
        # fake emails - be safe!
        u.email = rand_email
        dup_count +=1 and next if !email.blank? && email != '0' && User.find_by_email(email)
        
        # parse the name field
        namesplit = fullname.split(', ')
        u.first_name = namesplit.first
        u.last_name = namesplit.second

        # parse the address field
        addrsplit = addressfield.split(', ')
        # TBD! (no address field in model yet)

        # give them a login
        u.login = u.email
        #u.login = "#{u.last_name}#{u.first_name[0..1]}" if u.email.blank? || u.email == '0'

        # give them a password
        u.password = u.password_confirmation = 'test123' #rand_string(15)

        # activate them
        u.activated_at = Date.yesterday

        if u.save
          created_count+=1
        else
            err_count+=1 
            puts "Error! email:#{email}: #{u.errors.first}"
        end
        
      end
      puts "Created #{created_count} users"
      puts "Error for #{err_count} users"
      puts "Duplicate #{dup_count} users"
      puts "Check #{created_count + err_count + dup_count} = #{newusers.length}"

    end
end
