require_relative "./calendar"
require "Date"

banner = <<-BANNER
Usage: ruby cal.rb [month] [year]

     ARG    |  OPTIONAL  |        DESCRIPTION        |   EXAMPLE
    month   |    true    |  Desired calendar month   |     12
     year   |    true    |   Desired calendar year   |    2022

Without any arguments the calendar for the current month and year is printed

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
