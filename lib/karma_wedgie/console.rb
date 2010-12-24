require 'karma_wedgie'
require 'rubygems'
require 'highline/import'

module KarmaWedgie
  class Console < Base 
    def run
      begin
        while line = ask("Password regexp?: "){|q| q.echo = false}
          query(line)
        end
      rescue EOFError
        # do nothing for now
      rescue Interrupt
          puts "\nInterrupt, exiting."
          system "stty echo"
          exit 1
      #rescue
      #  puts "ERROR: #{$!}\n"
      end
    end


    def choice(count)
      max=count-1
      number = ask("1-#{max} ? ", Integer) { |q| q.in = 1..max }
    end

  end
end
