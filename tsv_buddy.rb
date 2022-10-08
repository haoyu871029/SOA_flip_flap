# frozen_string_literal: true

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    rows = tsv.split("\n").map { |line| line.split("\t") }
    headers = rows.first
    data_rows = rows[1..]
    @data = data_rows.map { |row| row.map.with_index { |cell, i| [headers[i], cell] }.to_h }
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    output_str = @data[0].keys.join("\t")
    output_str << "\n"
    @data.each do |student_i|
      info = student_i.values
      output_str << info.join("\t")
      output_str << "\n"
    end
    output_str
  end
end
