class Calendar
  attr_reader :month, :year

  def initialize(month: nil, year: nil)
    @month, @year = month, year
  end

  def print_to_console
    month = @month.nil? ? Date.today.month : @month
    year = @year.nil? ? Date.today.year : @year

    if @year.nil? && !@month.nil? && @month > 12
      month, year = Date.today.month, @month
    end

    date = Date.new(year, month)

    print banner(date)
  end

  private

  def banner date
    output = ""

    days_in_month = Date.new(date.year, date.month, -1).day
    days_array = (1..days_in_month).to_a

    starting_week_day = Date.new(date.year, date.month, 1).wday
    week_one_whitespace = starting_week_day == 0 ? " " : " "*(starting_week_day*2) + " "*(starting_week_day+1)

    max_line_length = 20
    left_padding = " " * 8

    output << left_padding + first_line(date, max_line_length) + "\n"
    output << left_padding + "Su Mo Tu We Th Fr Sa\n"

    line = ""

    days_array.each do |d|
      case d
      when 1
        line << week_one_whitespace + d.to_s
      when 2..9
        line << " " + d.to_s
      when 10..days_in_month-1
        line << d.to_s
      when days_in_month
        line << d.to_s
        output << left_padding + line + "\n"
        return output
      end

      if line.length == 20
        output << left_padding + line + "\n"
        line = ""
      else
        line << " "
      end
    end
  end

  def first_line date, max_line_length
    date_string = date.strftime('%B %Y')
    margin = " " * ((max_line_length - date_string.length) / 2).floor

    margin+date_string
  end

end

#  SEND TO dan@oysterhr.com