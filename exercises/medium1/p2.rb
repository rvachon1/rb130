class TextAnalyzer
  def process
    # your implementation
    text = File.read('sample_text.txt')
    puts yield(text)
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| "#{text.split("\n\n").count} paragraphs" }
analyzer.process { |text| "#{text.split("\n").count} lines" }
analyzer.process { |text| "#{text.split(" ").count} words" }