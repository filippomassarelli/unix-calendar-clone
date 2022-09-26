require_relative "./calendar"
require "Date"

banner = <<-BANNER
Usage: ruby mars_rovers.rb "world" ["rover_data"]

     ARG      |       DESCRIPTION       |     EXAMPLE
   "world"    |   the size of the map   |      "4 8"
 "rover_data" | rover coords & commands |  "(2, 3, E) LFRFF"

-h, --help           Prints this message
BANNER

if ARGV[0] == "-h" || ARGV[0] == "--help"
  puts banner
  exit
end

def call_calendar(*args)
  month, year = args.map(&:to_i)
  Calendar.new(month: month, year: year).print_to_console
end

call_calendar(*ARGV)
