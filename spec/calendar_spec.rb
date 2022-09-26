require_relative "../calendar"
require "Date"

RSpec.describe Calendar do
  describe ".print_to_console" do
    context "September" do
      it "outputs the right date in the calendar" do
        expected_format = <<-BANNER
           September 2022
        Su Mo Tu We Th Fr Sa
                     1  2  3
         4  5  6  7  8  9 10
        11 12 13 14 15 16 17
        18 19 20 21 22 23 24
        25 26 27 28 29 30
        BANNER

        expect{ Calendar.new(month: 9, year: 2022).print_to_console }.to output(expected_format).to_stdout
      end
    end

    context "October" do
      it "outputs the right date in the calendar" do
        expected_format = <<-BANNER
            October 2022
        Su Mo Tu We Th Fr Sa
                           1
         2  3  4  5  6  7  8
         9 10 11 12 13 14 15
        16 17 18 19 20 21 22
        23 24 25 26 27 28 29
        30 31
        BANNER

        expect{ Calendar.new(month: 10, year: 2022).print_to_console }.to output(expected_format).to_stdout
      end
    end
  end

end

