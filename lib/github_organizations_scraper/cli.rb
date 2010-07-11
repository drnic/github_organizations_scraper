require 'optparse'
require 'open-uri'
require 'nokogiri'

module GithubOrganizationsScraper
  class CLI
    def self.execute(stdout, arguments=[])

      options = {}

      parser = OptionParser.new do |opts|
        opts.banner = <<-BANNER.gsub(/^          /,'')
          Display the members of an organisation account on GitHub.

          Usage: #{File.basename($0)} [options]

          Options are:
        BANNER
        opts.separator ""
        # opts.on("-j", "--json",
        #         "Display results in JSON format") { options[:json] = true }
        opts.on("-h", "--help",
                "Show this help message.") { stdout.puts opts; exit }
        opts.parse!(arguments)

      end
      
      account = arguments.shift
      doc = Nokogiri::HTML(open("http://github.com/#{account}"))
      members = doc.search("ul.org-members li").map do |member|
        account = member.search("h4 a").text
        if member.search("h4 em").text =~ /\((.*)\)/
          name  = $1
        end
        { :account => account, :name => name }
      end
      
      display_members_tty(stdout, members)
    end
    
    def self.display_members_tty(stdout, members)
      members.each do |member|
        details = [member[:account], member[:name]].reject { |d| d.nil? }
        stdout.puts details.join(" - ")
      end
    end
  end
end